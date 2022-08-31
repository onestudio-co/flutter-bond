import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';

class OfferRemoteDataSource extends DataSource {
  final ApiClient _client;

  OfferRemoteDataSource(this._client);

  Future<ListResponse<Offer>> allOffers(
      {String? nextUrl, int? cityId, int? serviceProviderCategoryId}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? OfferApis.offers,
      queryParameters: <String, dynamic>{
        'service_provider_category_id': serviceProviderCategoryId,
        'city_id': cityId,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Offer>> allServiceProviderOffer(
      {int? serviceProviderId, String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? OfferApis.serviceProviderOffer(serviceProviderId!),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Offer>> similarOffer(int offerId) async {
    final Response<dynamic> response = await _client.get(
      OfferApis.similarOffer(offerId),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Offer>> searchOffer({required String text}) async {
    final Response<dynamic> response = await _client.get(
      OfferApis.searchOffer,
      queryParameters: <String, dynamic>{
        'title': text,
        'content': text,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<User>> getPremiumServiceProvider() async {
    final Response<dynamic> response = await _client.get(
      OfferApis.premiumServiceProviders,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Offer>> lastOffers() async {
    final Response<dynamic> response = await _client.get(
      OfferApis.lastOffers,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension OfferApis on Api {
  static String get offers => 'offers';

  static String get premiumServiceProviders => 'premium-service-providers';

  static String get searchOffer => 'search-offers';

  static String serviceProviderOffer(int serviceProviderId) =>
      'offers/user/$serviceProviderId';

  static String similarOffer(int offerId) => 'similar-offers/$offerId';

  static String get lastOffers => 'limited-offers';
}
