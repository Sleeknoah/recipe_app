import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Environment {
  @EnviedField(varName: "STAGING_SERVER", obfuscate: true)
  static final String stagingServer = _Environment.stagingServer;
}
