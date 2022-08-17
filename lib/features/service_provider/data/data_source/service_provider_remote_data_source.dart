import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';

class ServiceProviderRemoteDataSource extends DataSource {
  final ApiClient _client;

  ServiceProviderRemoteDataSource(this._client);

  Future<ListResponse<User>> getServiceProviers() async {
    final Response<dynamic> response = await _client.get(
      Apis.serviceProvider(),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension Apis on Api {
  static String serviceProvider() {
    return 'service-providers';
  }
}
