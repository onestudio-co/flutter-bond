import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';

class CityRemoteDataSource extends DataSource {
  final ApiClient _client;

  CityRemoteDataSource(this._client);

  Future<ListResponse<City>> getCities() async {
    final Response<dynamic> response = await _client.get(
      AdsApis.city(),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension AdsApis on Api {
  static String city() {
    return 'cities';
  }
}
