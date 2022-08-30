import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/main/last_opportunities/cubit/last_opportunities_cubit.dart';
import 'package:taleb/features/home/opportunities/data/data_source/opportunity_remote_data_source.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';
import 'package:taleb/features/home/opportunities/data/services/algolia_opportunity_service.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/cubit/opportunity_category_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_details/cubit/similer_opportunity_cubit.dart';
import 'package:taleb/integrations/algolia.dart';

class OpportunityServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AlgoliaOpportunityService(
        algoliaService: AlgoliaInitialization.algoliaObject));
    it.registerFactory(() => OpportunityRemoteDataSource(it()));
    it.registerFactory(() => OpportunityRepository(it()));
    it.registerFactory(() => OpportunityCategoryCubit(it()));
    it.registerFactory(() => OpportunityCubit(it(), it()));
    it.registerFactory(() => SimilerOpportunityCubit(it()));
    it.registerFactory(() => LastOpportunitiesCubit(it()));
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
