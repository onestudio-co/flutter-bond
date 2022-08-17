part of 'searvice_provider_news_cubit.dart';

abstract class ServiceProviderNewsState extends Equatable {}

class ServiceProviderNewsInitial extends ServiceProviderNewsState {
  @override
  List<Object?> get props => [];
}

class ServiceProviderNewsLoading extends ServiceProviderNewsState {
  @override
  List<Object?> get props => [];
}

class ServiceProviderNewsEmpty extends ServiceProviderNewsState {
  ServiceProviderNewsEmpty();

  @override
  List<Object?> get props => [];
}

class ServiceProviderNewsLoadSuccess extends ServiceProviderNewsState {
  final ListResponse<News> news;

  ServiceProviderNewsLoadSuccess({required this.news});

  bool get noMorePages => news.links?.next == null;

  @override
  List<Object?> get props => [news];

  ServiceProviderNewsLoadSuccess copyWith({
    ListResponse<News>? news,
  }) {
    return ServiceProviderNewsLoadSuccess(
      news: news ?? this.news,
    );
  }
}

class ServiceProviderNewsLoadMoreState extends ServiceProviderNewsLoadSuccess {
  ServiceProviderNewsLoadMoreState({
    required ListResponse<News> news,
  }) : super(news: news);

  @override
  List<Object> get props => [news];
}

class ServiceProviderNewsLoadFailed extends ServiceProviderNewsState {
  final String error;

  ServiceProviderNewsLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
