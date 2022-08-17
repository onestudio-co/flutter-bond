import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';

import '../models/news.dart';

class NewsRemoteDataSource extends DataSource {
  final ApiClient _client;

  NewsRemoteDataSource(this._client);

  Future<ListResponse<News>> allNews({String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NewsApis.allNews(),
      headers: Api.headers(),
    );
    if ((response.statusCode ?? 0) <= 204) {
      return ListResponse<News>.fromJson(response.data);
    } else {
      throw ServerException.fromResponse(
        json.encode(response.data),
        response.statusCode,
      );
    }
  }

  Future<ListResponse<News>> allServiceProviderNews(
      {int? serviceProviderId, String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NewsApis.serviceProviderNews(serviceProviderId!),
      headers: Api.headers(),
    );
    if ((response.statusCode ?? 0) <= 204) {
      return ListResponse<News>.fromJson(response.data);
    } else {
      throw ServerException.fromResponse(
        json.encode(response.data),
        response.statusCode,
      );
    }
  }
}

extension NewsApis on Api {
  static String allNews() {
    return 'news';
  }

  static String serviceProviderNews(int serviceProviderId) {
    return 'service-provider-news/$serviceProviderId';
  }
}
