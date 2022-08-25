import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/offer_remote_data_source.dart';
import '../models/offer.dart';

class OfferRepository {
  final OfferRemoteDataSource _remoteDataSource;

  OfferRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Offer>>> allOffer(
      {String? nextUrl, int? cityId, int? searviceProviderId}) async {
    try {
      final ListResponse<Offer> response = await _remoteDataSource.allOffer(
          nextUrl: nextUrl,
          cityId: cityId,
          searviceProviderId: searviceProviderId);
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

  Future<Either<Failure, ListResponse<Offer>>> similerOffer(int offerId) async {
    try {
      final ListResponse<Offer> response =
          await _remoteDataSource.similerOffer(offerId);
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
