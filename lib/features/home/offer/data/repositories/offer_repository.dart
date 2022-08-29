import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';

class OfferRepository {
  final OfferRemoteDataSource _remoteDataSource;

  OfferRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Offer>>> allOffers(
      {String? nextUrl, int? cityId, int? serviceProviderCategoryId}) async {
    try {
      final ListResponse<Offer> response = await _remoteDataSource.allOffers(
        nextUrl: nextUrl,
        serviceProviderCategoryId: serviceProviderCategoryId,
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

  Future<Either<Failure, ListResponse<Offer>>> lastOffers() async {
    try {
      final ListResponse<Offer> response = await _remoteDataSource.lastOffers();
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

  Future<Either<Failure, ListResponse<User>>>
      getPremiumServiceProvider() async {
    try {
      final ListResponse<User> response =
          await _remoteDataSource.getPremiumServiceProvider();
      return Right<Failure, ListResponse<User>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<User>>(e.toFailure());
    }
  }
}
