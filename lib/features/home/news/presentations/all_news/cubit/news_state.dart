part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  final User? serviceProvider;
  final City? city;
  const NewsState({
    required this.serviceProvider,
    required this.city,
  });

  User? get selectedServiceProvider => serviceProvider;

  City? get selectedCity => city;

  bool get isSlectedNotNull =>
      selectedServiceProvider != null || selectedCity != null;

  NewsLoading loading() {
    return NewsLoading(serviceProvider: serviceProvider, city: city);
  }

  NewsLoadFailed faild(String error) {
    return NewsLoadFailed(
        error: error, city: city, serviceProvider: serviceProvider);
  }

  NewsEmpty empty() {
    return NewsEmpty(city: city, serviceProvider: serviceProvider);
  }

  NewsLoadSuccess loadSuccess(ListResponse<News> news) {
    return NewsLoadSuccess(
        news: news, city: city, serviceProvider: serviceProvider);
  }

  NewsLoadMoreState loadMore(ListResponse<News> news) {
    return NewsLoadMoreState(
        news: news, city: city, serviceProvider: serviceProvider);
  }
}

class NewsInitial extends NewsState {
  const NewsInitial({User? serviceProvider, City? city})
      : super(serviceProvider: serviceProvider, city: city);

  @override
  List<Object?> get props => [serviceProvider, city];
}

class NewsLoading extends NewsState {
  const NewsLoading({User? serviceProvider, City? city})
      : super(serviceProvider: serviceProvider, city: city);

  @override
  List<Object?> get props => [serviceProvider, city];
}

class NewsEmpty extends NewsState {
  const NewsEmpty({User? serviceProvider, City? city})
      : super(serviceProvider: serviceProvider, city: city);

  @override
  List<Object?> get props => [serviceProvider, city];
}

class NewsLoadSuccess extends NewsState {
  final ListResponse<News> news;

  const NewsLoadSuccess({
    required this.news,
    User? serviceProvider,
    City? city,
  }) : super(serviceProvider: serviceProvider, city: city);

  bool get noMorePages => news.links?.next == null;

  NewsLoadSuccess clearSelected() {
    return NewsLoadSuccess(news: news, city: null, serviceProvider: null);
  }

  NewsLoadSuccess copyWith({
    ListResponse<News>? news,
    User? serviceProvider,
    City? city,
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

  const NewsLoadFailed({
    required this.error,
    final User? serviceProvider,
    final City? city,
  }) : super(
          serviceProvider: serviceProvider,
          city: city,
        );

  @override
  List<Object?> get props => [error, serviceProvider, city];
}
