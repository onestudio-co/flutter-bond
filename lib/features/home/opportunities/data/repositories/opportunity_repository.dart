import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/data_source/opportunity_remote_data_source.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';

import '../models/opportunity.dart';

class OpportunityRepository {
  final OpportunityRemoteDataSource _remoteDataSource;

  OpportunityRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<OpportunityCategory>>>
      allCategories() async {
    try {
      final ListResponse<OpportunityCategory> response =
          await _remoteDataSource.opportunitiesCategories();
      return Right<Failure, ListResponse<OpportunityCategory>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<OpportunityCategory>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Opportunity>>>
      opportunitiesForSpecifiecCategory(
          {int? categoryId, String? nextUrl}) async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.opportunitiesForSpecifiecCategory(
        nextUrl: nextUrl,
        categoryId: categoryId,
      );
      return Right<Failure, ListResponse<Opportunity>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Opportunity>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Opportunity>>> opportunityForSpecificCity(
      {required int cityId, String? nextUrl}) async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.opportunityForSpecificCity(
        nextUrl: nextUrl,
        cityId: cityId,
      );
      return Right<Failure, ListResponse<Opportunity>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Opportunity>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Opportunity>>> similerOpportunities(
      int opportuityId) async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.similerOpportunities(opportuityId);
      return Right<Failure, ListResponse<Opportunity>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Opportunity>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Opportunity>>> lastOpportunities() async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.lastOpportunities();
      return Right<Failure, ListResponse<Opportunity>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Opportunity>>(e.toFailure());
    }
  }

  Future<Either<Failure, ListResponse<Opportunity>>> searchOpportnities(
      {required String text}) async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.searchOpportnities(text: text);
      return Right<Failure, ListResponse<Opportunity>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<Opportunity>>(e.toFailure());
    }
  }
}
