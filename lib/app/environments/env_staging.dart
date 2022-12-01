import 'package:envied/envied.dart';

part 'env_staging.g.dart';

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseURL = _EnvStaging.apiBaseURL;
  @EnviedField(varName: 'CONNECT_TIMEOUT')
  static const int connectTimeOut = _EnvStaging.connectTimeOut;
  @EnviedField(varName: 'SEND_TIMEOUT')
  static const int sendTimeOut = _EnvStaging.sendTimeOut;
  @EnviedField(varName: 'RECEIVE_TIMEOUT')
  static const int receiveTimeOut = _EnvStaging.receiveTimeOut;
  @EnviedField(varName: 'RECEIVE_DATA_WHEN_STATUS_ERROR')
  static const bool receiveDateWhenStatusError =
      _EnvStaging.receiveDateWhenStatusError;

  static dynamic get(String key) {
    switch (key) {
      case 'API_BASE_URL':
        return apiBaseURL;
      case 'CONNECT_TIMEOUT':
        return connectTimeOut;
      case 'SEND_TIMEOUT':
        return sendTimeOut;
      case 'RECEIVE_TIMEOUT':
        return receiveTimeOut;
      case 'RECEIVE_DATA_WHEN_STATUS_ERROR':
        return receiveDateWhenStatusError;
      default:
        return null;
    }
  }
}
