import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';

import '../models/offer.dart';

class OfferRemoteDataSource extends DataSource {
  final ApiClient _client;

  OfferRemoteDataSource(this._client);

  Future<ListResponse<Offer>> allOffer(
      {String? nextUrl, int? cityId, int? searviceProviderId}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? OfferApis.allOffer,
      queryParameters: <String, dynamic>{
        'user': searviceProviderId,
        'city': cityId,
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

  Future<ListResponse<Offer>> similerOffer(int offerId) async {
    final Response<dynamic> response = await _client.get(
      OfferApis.similerOffer(offerId),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Offer>> searchOffer({required String text}) async {
    final Response<dynamic> response = await _client.get(
      OfferApis.searchOffer,
      queryParameters: <String, dynamic>{
        'text': text,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension OfferApis on Api {
  static String get allOffer => 'offer';

  static String serviceProviderOffer(int serviceProviderId) {
    return 'offer/user/$serviceProviderId';
  }

  static String similerOffer(int offerId) {
    return 'similar-offer/$offerId';
  }

  static String get searchOffer => 'search-offer';
}
