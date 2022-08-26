import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/integrations/algolia.dart';
import 'offer_imports.dart';

class OfferServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AlgoliaOfferService(
        algoliaService: AlgoliaInitialization.algoliaObject));
    it.registerFactory(() => OfferRemoteDataSource(it()));
    it.registerFactory(() => OfferRepository(it()));
    it.registerFactory(() => OffersCubit(it(), it()));
    it.registerFactory(() => ServiceProviderOfferCubit(it()));
    it.registerFactory(() => SimilarOffersCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Offer:
        return Offer.fromJson(json) as T;
      case City:
        return City.fromJson(json) as T;
      case User:
        return User.fromJson(json) as T;
      default:
        return null;
    }
  }
}
