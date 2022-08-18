import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/data_source/opportunity_remote_data_source.dart';

import '../models/opportunity.dart';

class OpportunityRepository {
  final OpportunityRemoteDataSource _remoteDataSource;

  OpportunityRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Opportunity>>>
      opportunitiesForSpecifiecCategory({String? nextUrl, int? cityId}) async {
    try {
      final ListResponse<Opportunity> response =
          await _remoteDataSource.opportunitiesForSpecifiecCategory(
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
}
