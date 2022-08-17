part of 'ad_cubit.dart';

abstract class AdState extends Equatable {
  const AdState();
}

class AdInitialState extends AdState {
  @override
  List<Object> get props => [];
}

class AdLoadingState extends AdState {
  @override
  List<Object> get props => [];
}

class AdLoadedSuccessState extends AdState {
  final List<Ad> onBoarding;

  const AdLoadedSuccessState(this.onBoarding);
  @override
  List<Object> get props => [onBoarding];
}

class AdLoadFailure extends AdState {
  final String error;

  const AdLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
