part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  final User? serviceProvider;
  final City? city;
  final String? searchText;
  const NewsState({
    this.searchText,
    this.serviceProvider,
    this.city,
  });

  User? get selectedServiceProvider => serviceProvider;

  City? get selectedCity => city;

  bool get isSlectedNotNull =>
      selectedServiceProvider != null || selectedCity != null;

  NewsLoading loading() {
    return NewsLoading(
        serviceProvider: serviceProvider, city: city, searchText: searchText);
  }

  NewsLoadFailed faild(String error) {
    return NewsLoadFailed(
        error: error,
        city: city,
        serviceProvider: serviceProvider,
        searchText: searchText);
  }

  NewsEmpty empty() {
    return NewsEmpty(
        news: const ListResponse<News>(data: []),
        city: city,
        serviceProvider: serviceProvider,
        searchText: searchText);
  }

  NewsLoadSuccess loadSuccess(ListResponse<News> news) {
    return NewsLoadSuccess(
        news: news,
        city: city,
        serviceProvider: serviceProvider,
        searchText: searchText);
  }

  NewsLoadMoreState loadMore(ListResponse<News> news) {
    return NewsLoadMoreState(
        news: news,
        city: city,
        serviceProvider: serviceProvider,
        searchText: searchText);
  }
}

class NewsInitial extends NewsState {
  const NewsInitial({
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  @override
  List<Object?> get props => [serviceProvider, city, searchText];
}

class NewsLoading extends NewsState {
  const NewsLoading({
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  @override
  List<Object?> get props => [serviceProvider, city, searchText];
}

class NewsEmpty extends NewsLoadSuccess {
  const NewsEmpty({
    required ListResponse<News> news,
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          news: news,
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  @override
  List<Object?> get props => [serviceProvider, city, searchText];
}

class NewsLoadSuccess extends NewsState {
  final ListResponse<News> news;

  const NewsLoadSuccess({
    required this.news,
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  bool get noMorePages => news.links?.next == null;

  NewsLoadSuccess clearSelected() {
    return NewsLoadSuccess(
      news: news,
      city: null,
      serviceProvider: null,
      searchText: searchText,
    );
  }

  NewsLoadSuccess clearFilterServiceProvider() {
    return NewsLoadSuccess(
      news: news,
      city: city,
      serviceProvider: null,
      searchText: searchText,
    );
  }

  NewsLoadSuccess clearFilterCity() {
    return NewsLoadSuccess(
      news: news,
      city: null,
      serviceProvider: serviceProvider,
      searchText: searchText,
    );
  }

  NewsLoadSuccess copyWith({
    ListResponse<News>? news,
    User? serviceProvider,
    City? city,
    String? searchText,
  }) {
    return NewsLoadSuccess(
      news: news ?? this.news,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      city: city ?? this.city,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  List<Object?> get props => [news, serviceProvider, city, searchText];
}

class NewsLoadMoreState extends NewsLoadSuccess {
  const NewsLoadMoreState({
    required ListResponse<News> news,
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          news: news,
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  @override
  List<Object?> get props => [news, serviceProvider, city, searchText];
}

class NewsLoadFailed extends NewsState {
  final String error;

  const NewsLoadFailed({
    required this.error,
    final User? serviceProvider,
    final City? city,
    final String? searchText,
  }) : super(
          serviceProvider: serviceProvider,
          city: city,
          searchText: searchText,
        );

  @override
  List<Object?> get props => [error, serviceProvider, city, searchText];
}
