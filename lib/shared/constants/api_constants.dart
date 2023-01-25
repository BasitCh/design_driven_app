import 'package:black_bull_markets/shared/enums/environments.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  String blackBullBaseApi = dotenv.get(EnvironmentKeys.blackbullApi.name);
}
