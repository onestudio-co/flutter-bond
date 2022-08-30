import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/main/last_news/cubit/last_news_cubit.dart';
import 'package:taleb/features/home/news/data/models/media.dart';
import 'package:taleb/features/home/news/data/services/algolia_news_service.dart';
import 'package:taleb/features/home/news/presentations/all_news/cubit/news_cubit.dart';
import 'package:taleb/features/home/news/presentations/news_details/cubit/similer_cubit.dart';
import 'package:taleb/integrations/algolia.dart';

import 'data/data_source/news_remote_data_source.dart';
import 'data/models/news.dart';
import 'data/repositories/news_repository.dart';
import 'presentations/searvice_provider_news/cubit/searvice_provider_news_cubit.dart';

class NewsServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AlgoliaNewsService(
        algoliaService: AlgoliaInitialization.algoliaObject));
    it.registerFactory(() => NewsRemoteDataSource(it()));
    it.registerFactory(() => NewsRepository(it()));
    it.registerFactory(() => NewsCubit(it(), it()));
    it.registerFactory(() => ServiceProviderNewsCubit(it()));
    it.registerFactory(() => SimilerCubit(it()));
    it.registerFactory(() => LastNewsCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case News:
        return News.fromJson(json) as T;
      case City:
        return City.fromJson(json) as T;
      case User:
        return User.fromJson(json) as T;
      case Media:
        return Media.fromJson(json) as T;
      default:
        return null;
    }
  }
}
