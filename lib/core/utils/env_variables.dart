import 'package:envied/envied.dart';

part 'env_variables.g.dart';

@Envied(path: '.env.dev')
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String apiUrl = _Env.apiUrl;
}
