part of 'paid_ad_cubit.dart';

abstract class PaidAdState extends Equatable {
  const PaidAdState();
}

class PaidAdInitialState extends PaidAdState {
  @override
  List<Object> get props => [];
}

class PaidAdLoadingState extends PaidAdState {
  @override
  List<Object> get props => [];
}

class PaidAdLoadedSuccessState extends PaidAdState {
  final List<Ad> ads;

  const PaidAdLoadedSuccessState(this.ads);
  @override
  List<Object> get props => [ads];
}

class PaidAdLoadFailure extends PaidAdState {
  final String error;

  const PaidAdLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
