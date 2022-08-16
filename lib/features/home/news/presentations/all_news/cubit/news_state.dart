part of 'news_cubit.dart';

abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsEmpty extends NewsState {
  NewsEmpty();

  @override
  List<Object?> get props => [];
}

class NewsLoadSuccess extends NewsState {
  final ListResponse<News> news;

  NewsLoadSuccess({required this.news});

  bool get noMorePages => news.links?.next == null;

  @override
  List<Object?> get props => [news];

  NewsLoadSuccess copyWith({
    ListResponse<News>? news,
  }) {
    return NewsLoadSuccess(
      news: news ?? this.news,
    );
  }
}

class NewsLoadMoreState extends NewsLoadSuccess {
  NewsLoadMoreState({
    required ListResponse<News> news,
  }) : super(news: news);

  @override
  List<Object> get props => [news];
}

class NewsLoadFailed extends NewsState {
  final String error;

  NewsLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
