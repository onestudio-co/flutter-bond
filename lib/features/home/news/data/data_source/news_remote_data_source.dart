import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';

import '../models/news.dart';

class NewsRemoteDataSource extends DataSource {
  final ApiClient _client;

  NewsRemoteDataSource(this._client);

  Future<ListResponse<News>> allNews(
      {String? nextUrl, int? cityId, int? searviceProviderId}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NewsApis.allNews,
      queryParameters: <String, dynamic>{
        'user': searviceProviderId,
        'city': cityId,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<News>> allServiceProviderNews(
      {int? serviceProviderId, String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NewsApis.serviceProviderNews(serviceProviderId!),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<News>> similerNews(int newsId) async {
    final Response<dynamic> response = await _client.get(
      NewsApis.similerNews(newsId),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<News>> lastNews() async {
    final Response<dynamic> response = await _client.get(
      NewsApis.lastNews,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<News>> searchNews({
    required String text,
    int? userId,
    int? cityId,
  }) async {
    final Response<dynamic> response = await _client.get(
      NewsApis.searchNews,
      queryParameters: <String, dynamic>{
        'text': text,
        'user_id': userId,
        'city_id': cityId,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension NewsApis on Api {
  static String get allNews => 'news';

  static String get lastNews => 'limited-news';

  static String serviceProviderNews(int serviceProviderId) {
    return 'news/user/$serviceProviderId';
  }

  static String similerNews(int newsId) {
    return 'similar-news/$newsId';
  }

  static String get searchNews => 'search-news';
}
