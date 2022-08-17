part of 'similer_cubit.dart';

abstract class SimilerState extends Equatable {
  const SimilerState();

  @override
  List<Object> get props => [];
}

class SimilerInitial extends SimilerState {
  @override
  List<Object> get props => [];
}

class SimilerLoading extends SimilerState {
  @override
  List<Object> get props => [];
}

class SimilerLoadedSuccess extends SimilerState {
  final List<News> news;

  const SimilerLoadedSuccess(this.news);
  @override
  List<Object> get props => [news];
}

class SimilerLoadFailure extends SimilerState {
  final String error;

  const SimilerLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
