import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/opportunities/data/data_source/opportunity_remote_data_source.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';
import 'package:taleb/features/home/opportunities/data/services/algolia_opportunity_service.dart';
import 'package:taleb/integrations/algolia.dart';

class OpportunityServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AlgoliaOpportunityService(
        algoliaService: AlgoliaInitialization.algoliaObject));
    it.registerFactory(() => OpportunityRemoteDataSource(it()));
    it.registerFactory(() => OpportunityRepository(it()));
    // it.registerFactory(() => OpportunityCubit(it(), it()));
    // it.registerFactory(() => SimilerOpportunityCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Opportunity:
        return Opportunity.fromJson(json) as T;
      case City:
        return City.fromJson(json) as T;
      case OpportunityCategory:
        return OpportunityCategory.fromJson(json) as T;
      default:
        return null;
    }
  }
}
