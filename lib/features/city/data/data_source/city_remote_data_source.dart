import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';

class CityRemoteDataSource extends DataSource {
  final ApiClient _client;

  CityRemoteDataSource(this._client);

  Future<ListResponse<City>> getCities({String? textSearch}) async {
    final Response<dynamic> response = await _client.get(
      CityApis.city(),
      queryParameters: <String, dynamic>{
        'name': textSearch,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension CityApis on Api {
  static String city() {
    return 'cities';
  }
}
