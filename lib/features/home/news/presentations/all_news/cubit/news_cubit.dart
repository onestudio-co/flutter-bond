import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/data/repositories/news_repository.dart';
import 'package:taleb/features/home/news/data/services/algolia_news_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._repository, this.algoliaSubspecialtiesService)
      : super(const NewsInitial());

  final NewsRepository _repository;
  final AlgoliaNewsService algoliaSubspecialtiesService;

  Future<void> loadNews(
      {int? cityId, int? searviceProviderId, bool emitLoading = false}) async {
    if (emitLoading) {
      emit(state.loading());
    }

    if (state is NewsLoadSuccess) {
      await _loadNewsNextPage(
        currentState: state as NewsLoadSuccess,
      );
    } else {
      await _loadNews(cityId: cityId, searviceProviderId: searviceProviderId);
    }
  }

  Future<void> _loadNews({int? cityId, int? searviceProviderId}) async {
    emit(state.loading());
    final Either<Failure, ListResponse<News>> response = await _repository
        .allNews(cityId: cityId, searviceProviderId: searviceProviderId);
    emit(
      response.fold(
        (Failure failure) => NewsLoadFailed(error: failure.toMessage()),
        (ListResponse<News> news) =>
            news.data.isEmpty ? state.empty() : state.loadSuccess(news),
      ),
    );
  }

  Future<void> _loadNewsNextPage({
    required NewsLoadSuccess currentState,
  }) async {
    if (currentState.noMorePages) {
      return;
    }
    if (currentState is NewsLoadMoreState) {
      return;
    }

    emit(state.loadSuccess(currentState.news));

    final Either<Failure, ListResponse<News>> response =
        await _repository.allNews(nextUrl: currentState.news.links?.next);

    response.fold(
      (Failure failure) => emit(state.faild(failure.toString())),
      (ListResponse<News> news) => <void>{
        emit(
          currentState.copyWith(
            news: currentState.news.copyWith(
              data: currentState.news.data + news.data,
              links: news.links,
            ),
          ),
        ),
      },
    );
  }

  // Future<void> searchNews(String text) async {
  //   try {
  //     emit(NewsLoading());
  //     final List<News> response =
  //         await algoliaSubspecialtiesService.searchNews(text);
  //     ListResponse<News> listResponse = ListResponse<News>(data: response);
  //     emit(NewsLoadSuccess(news: listResponse));
  //   } catch (error) {
  //     emit(NewsLoadFailed(error: error.toString()));
  //   }
  // }

  Future<void> searchNews({
    required String text,
    int? userId,
    int? cityId,
  }) async {
    emit(state.loading());
    final Either<Failure, ListResponse<News>> response =
        await _repository.searchNews(
      text: text,
      userId: userId,
      cityId: cityId,
    );
    emit(response.fold(
      (Failure failure) => state.faild(failure.toString()),
      (ListResponse<News> news) =>
          news.data.isEmpty ? state.empty() : state.loadSuccess(news),
    ));
  }

  void selectServiceProviderAndCity({User? serviceProvider, City? city}) {
    if (state is NewsLoadSuccess) {
      final currentState = state as NewsLoadSuccess;
      emit(currentState.copyWith(serviceProvider: serviceProvider, city: city));
    }
  }

  void clearFilterResult() {
    final currentState = state as NewsLoadSuccess;
    emit(currentState.clearSelected());
  }

  void clearFilterServiceProvider() {
    final currentState = state as NewsLoadSuccess;
    emit(currentState.clearFilterServiceProvider());
    searchNews(text: state.searchText ?? '', cityId: state.city?.id);
  }

  void clearFilterCity() {
    final currentState = state as NewsLoadSuccess;
    emit(currentState.clearFilterCity());
    searchNews(text: state.searchText ?? '', userId: state.serviceProvider?.id);
  }
}
