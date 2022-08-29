import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';

class ServiceProviderRemoteDataSource extends DataSource {
  final ApiClient _client;

  ServiceProviderRemoteDataSource(this._client);

  Future<ListResponse<User>> getServiceProviers({String? textSearch}) async {
    final Response<dynamic> response = await _client.get(
      ServiceProviderApis.serviceProvider(),
      headers: Api.headers(),
      queryParameters: <String, dynamic>{
        'name': textSearch,
      },
    );
    return mapListResponse(response);
  }

  Future<ListResponse<User>> getPartners({String? textSearch}) async {
    final Response<dynamic> response = await _client.get(
      ServiceProviderApis.partners(),
      headers: Api.headers(),
      queryParameters: <String, dynamic>{
        'name': textSearch,
      },
    );
    return mapListResponse(response);
  }
}

extension ServiceProviderApis on Api {
  static String serviceProvider() => 'service-providers';
  static String partners() => 'partners';
}
