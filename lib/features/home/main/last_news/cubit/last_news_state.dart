part of 'last_news_cubit.dart';

abstract class LastNewsState extends Equatable {
  const LastNewsState();

  @override
  List<Object> get props => [];
}

class LastNewsInitial extends LastNewsState {
  @override
  List<Object> get props => [];
}

class LastNewsLoading extends LastNewsState {
  @override
  List<Object> get props => [];
}

class LastNewsEmptyData extends LastNewsState {
  @override
  List<Object> get props => [];
}

class LastNewsLoadedSuccess extends LastNewsState {
  final List<News> news;

  const LastNewsLoadedSuccess(this.news);
  @override
  List<Object> get props => [news];
}

class LastOfferLoadFailure extends LastNewsState {
  final String error;

  const LastOfferLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
