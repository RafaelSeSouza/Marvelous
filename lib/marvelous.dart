import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelous/business/cubits/characters_states.dart';

import 'business/cubits/characters_cubit.dart';
import 'data/models/characters/marvel_character_filter.dart';
import 'data/repositories/character_repository.dart';

class Marvelous extends StatelessWidget {
  final CharacterRepository characterRepository;

  const Marvelous({
    Key? key,
    required this.characterRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CharactersCubit>(
              create: (context) => CharactersCubit(
                characterRepository: characterRepository,
              ),
            ),
          ],
          child: const _TestWidget(),
        ),
      ),
    );
  }
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        BlocSelector<CharactersCubit, CharactersState, bool>(
          selector: (state) => state.busy,
          builder: (context, busy) => TextButton(
            onPressed: busy
                ? null
                : () => context.read<CharactersCubit>().load(
                      filter: const MarvelCharacterFilter(
                        nameStartsWith: 'Spider',
                      ),
                    ),
            child: busy
                ? const CircularProgressIndicator()
                : const Text('LOAD CHARACTERS'),
          ),
        ),
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) => !state.pagination.hasNextPage
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: state.busy
                      ? null
                      : () => context.read<CharactersCubit>().load(
                            loadMore: true,
                          ),
                  child: state.busy
                      ? const CircularProgressIndicator()
                      : const Text('LOAD MORE!'),
                ),
        ),
        const SizedBox(height: 10.0),
        const Expanded(
          child: _CharacterBogusList(),
        ),
      ],
    );
  }
}

class _CharacterBogusList extends StatelessWidget {
  const _CharacterBogusList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharactersCubit>().state;

    if (state.errors.contains(CharactersErrors.invalidCredentials)) {
      return const Text(
        'Invalid Credentials!',
        style: TextStyle(color: Colors.red),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        return Text(
          '${item.name} - ${item.resourceURI} - ${item.modified}',
        );
      },
    );
  }
}
