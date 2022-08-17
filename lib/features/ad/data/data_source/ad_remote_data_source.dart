import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/ad/data/models/ad.dart';

class AdRemoteDataSource extends DataSource {
  final ApiClient _client;

  AdRemoteDataSource(this._client);

  Future<ListResponse<Ad>> getAds({String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? AdsApis.ads(),
      headers: Api.headers(),
    );
    if ((response.statusCode ?? 0) <= 204) {
      return ListResponse<Ad>.fromJson(response.data);
    } else {
      throw ServerException.fromResponse(
        json.encode(response.data),
        response.statusCode,
      );
    }
  }
}

extension AdsApis on Api {
  static String ads() {
    return 'adds';
  }
}
