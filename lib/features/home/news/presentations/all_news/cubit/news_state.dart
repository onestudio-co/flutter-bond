part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsEmpty extends NewsState {
  const NewsEmpty();

  @override
  List<Object?> get props => [];
}

class NewsLoadSuccess extends NewsState {
  final ListResponse<News> news;
  final User? serviceProvider;
  final City? city;

  const NewsLoadSuccess({
    required this.news,
    this.serviceProvider,
    this.city,
  });

  bool get noMorePages => news.links?.next == null;

  User? get selectedServiceProvider => serviceProvider;

  City? get selectedCity => city;

  bool get isSlectedNotNull =>
      selectedServiceProvider != null || selectedCity != null;

  NewsLoadSuccess clearSelected() {
    return NewsLoadSuccess(news: news, city: null, serviceProvider: null);
  }

  NewsLoadSuccess copyWith({
    ListResponse<News>? news,
    final User? serviceProvider,
    final City? city,
  }) {
    return NewsLoadSuccess(
      news: news ?? this.news,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props => [news, serviceProvider, city];
}

class NewsLoadMoreState extends NewsLoadSuccess {
  const NewsLoadMoreState({
    required ListResponse<News> news,
    final User? serviceProvider,
    final City? city,
  }) : super(
          news: news,
          serviceProvider: serviceProvider,
          city: city,
        );

  @override
  List<Object?> get props => [news, serviceProvider, city];
}

class NewsLoadFailed extends NewsState {
  final String error;

  const NewsLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
