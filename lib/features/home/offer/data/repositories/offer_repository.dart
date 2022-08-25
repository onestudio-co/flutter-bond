import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/offer_remote_data_source.dart';
import '../models/offer.dart';

class OfferRepository {
  final OfferRemoteDataSource _remoteDataSource;

  OfferRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Offer>>> allOffers(
      {String? nextUrl, int? cityId, int? serviceProviderId}) async {
    try {
      final ListResponse<Offer> response = await _remoteDataSource.allOffers(
        nextUrl: nextUrl,
        serviceProviderId: serviceProviderId,
        cityId: cityId,
      );
      return Right<Failure, ListResponse<Offer>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Offer>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Offer>>> allServiceProviderOffer(
      {int? serviceProviderId, String? nextUrl}) async {
    try {
      final ListResponse<Offer> response =
          await _remoteDataSource.allServiceProviderOffer(
              serviceProviderId: serviceProviderId, nextUrl: nextUrl);
      return Right<Failure, ListResponse<Offer>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Offer>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Offer>>> similarOffer(int offerId) async {
    try {
      final ListResponse<Offer> response =
          await _remoteDataSource.similarOffer(offerId);
      return Right<Failure, ListResponse<Offer>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Offer>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Offer>>> searchOffer(
      {required String text}) async {
    try {
      final ListResponse<Offer> response =
          await _remoteDataSource.searchOffer(text: text);
      return Right<Failure, ListResponse<Offer>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Offer>>(e.toFailure());
    }
  }
}
