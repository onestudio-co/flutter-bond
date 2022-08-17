import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/data/repositories/news_repository.dart';

part 'searvice_provider_news_state.dart';

class ServiceProviderNewsCubit extends Cubit<ServiceProviderNewsState> {
  ServiceProviderNewsCubit(this._repository)
      : super(ServiceProviderNewsInitial());

  final NewsRepository _repository;

  Future<void> loadServiceProviderNews({int? serviceProviderId}) async {
    if (state is ServiceProviderNewsLoadSuccess) {
      await _loadNewsNextPage(
        currentState: state as ServiceProviderNewsLoadSuccess,
      );
    } else {
      await _loadNews(serviceProviderId: serviceProviderId);
    }
  }

  Future<void> _loadNews({int? serviceProviderId}) async {
    emit(ServiceProviderNewsLoading());
    final Either<Failure, ListResponse<News>> response = await _repository
        .allServiceProviderNews(serviceProviderId: serviceProviderId);
    emit(
      response.fold(
          (Failure failure) =>
              ServiceProviderNewsLoadFailed(error: failure.toMessage()),
          (ListResponse<News> news) => news.data.isEmpty
              ? ServiceProviderNewsEmpty()
              : ServiceProviderNewsLoadSuccess(news: news)),
    );
  }

  Future<void> _loadNewsNextPage({
    required ServiceProviderNewsLoadSuccess currentState,
  }) async {
    if (currentState.noMorePages) {
      return;
    }
    if (currentState is ServiceProviderNewsLoadMoreState) {
      return;
    }

    emit(ServiceProviderNewsLoadMoreState(
      news: currentState.news,
    ));

    final Either<Failure, ListResponse<News>> response =
        await _repository.allNews(nextUrl: currentState.news.links?.next);

    response.fold(
      (Failure failure) =>
          emit(ServiceProviderNewsLoadFailed(error: failure.toString())),
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
}
