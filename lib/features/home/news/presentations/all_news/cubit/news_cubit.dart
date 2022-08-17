
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._repository) : super(NewsInitial());

  final NewsRepository _repository;

  Future<void> loadNews() async {
    if (state is NewsLoadSuccess) {
      await _loadNewsNextPage(
        currentState: state as NewsLoadSuccess,
      );
    } else {
      await _loadNews();
    }
  }

  Future<void> _loadNews() async {
    emit(NewsLoading());
    final Either<Failure, ListResponse<News>> response =
        await _repository.allNews();
    emit(
      response.fold(
          (Failure failure) => NewsLoadFailed(error: failure.toMessage()),
          (ListResponse<News> news) =>
              news.data.isEmpty ? NewsEmpty() : NewsLoadSuccess(news: news)),
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

    emit(NewsLoadMoreState(
      news: currentState.news,
    ));

    final Either<Failure, ListResponse<News>> response =
        await _repository.allNews(nextUrl: currentState.news.links?.next);

    response.fold(
      (Failure failure) => emit(NewsLoadFailed(error: failure.toString())),
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
