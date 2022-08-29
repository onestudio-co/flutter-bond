import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/service_provider_category/data/models/service_provider_category.dart';

class ServiceProviderCategoryRemoteDataSource extends DataSource {
  final ApiClient _client;

  ServiceProviderCategoryRemoteDataSource(this._client);

  Future<ListResponse<ServiceProviderCategory>> getServiceProviderCategories(
      {String? textSearch}) async {
    final Response<dynamic> response = await _client.get(
      CityApis.serviceProviderCategories(),
      queryParameters: <String, dynamic>{
        'name': textSearch,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension CityApis on Api {
  static String serviceProviderCategories() {
    return 'service-providers-category';
  }
}
