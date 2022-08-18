import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';

import '../models/opportunity.dart';

class OpportunityRemoteDataSource extends DataSource {
  final ApiClient _client;

  OpportunityRemoteDataSource(this._client);

  Future<ListResponse<OpportunityCategory>> opportunitiesCategories() async {
    final Response<dynamic> response = await _client.get(
      OpportunityApis.opportunitiesCategory,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Opportunity>> opportunitiesForSpecifiecCategory(
      {int? categoryId, int? cityId, String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? OpportunityApis.opportunitySpecificCategory(categoryId!),
      queryParameters: <String, dynamic>{
        'city': cityId,
      },
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<ListResponse<Opportunity>> similerOpportunities(
      int opportuityId) async {
    final Response<dynamic> response = await _client.get(
      OpportunityApis.similerOpportunities(opportuityId),
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }
}

extension OpportunityApis on Api {
  static String get opportunitiesCategory => 'opportunities-categories';

  static String opportunitySpecificCategory(int categoryId) {
    return 'opportunities/category/$categoryId';
  }

  static String similerOpportunities(int opportunityId) {
    return 'similar-opportunity/$opportunityId';
  }
}
