import 'package:envied/envied.dart';

part 'environment.g.dart';

/// Holds the environment data.
///
/// Get your Marvel Comics API keys at `https://developer.marvel.com`.
/// Then create an '.env' file at the root of this project with your keys needed.
/// Finally, run 'flutter pub run build_runner build' to generate the part file.
///
/// ## Example of .env file
///
/// ```
/// MARVEL_PUBLIC_KEY=<YOUR MARVEL API PUBLIC KEY>
/// MARVEL_PRIVATE_KEY=<YOUR MARVEL API PRIVATE KEY>
/// ```
@Envied(obfuscate: true)
abstract class Environment {
  @EnviedField(varName: 'MARVEL_PUBLIC_KEY')
  static final marvelPublicKey = _Environment.marvelPublicKey;

  @EnviedField(varName: 'MARVEL_PRIVATE_KEY')
  static final marvelPrivateKey = _Environment.marvelPrivateKey;
}
