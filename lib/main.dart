import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'data/network/net_client.dart';
import 'data/providers/character_provider.dart';
import 'data/repositories/character_repository.dart';
import 'marvelous.dart';

void main() {
  _setupLogger();

  final client = NetClient(
    addLogger: false,
  );

  final characterRepository = CharacterRepository(
    provider: CharacterProvider(client),
  );

  runApp(
    Marvelous(
      characterRepository: characterRepository,
    ),
  );
}

void _setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (record) {
      debugPrint('${record.level.name} - ${record.time}: ${record.message}');
    },
  );
}
