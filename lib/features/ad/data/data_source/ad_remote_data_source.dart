import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/ad/data/models/ad.dart';

class AdRemoteDataSource extends DataSource {
  final ApiClient _client;

  AdRemoteDataSource(this._client);

  Future<ListResponse<Ad>> getAds() async {
    final Response<dynamic> response = await _client.get(
      AdsApis.ads,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Ad>> getPaidAds() async {
    final Response<dynamic> response = await _client.get(
      AdsApis.padidAds,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension AdsApis on Api {
  static String get ads => 'adds';
  static String get padidAds => 'paid-adds';
}
