part of 'paid_ad_cubit.dart';

abstract class PaidAdState extends Equatable {
  const PaidAdState();
}

class PaidAdInitial extends PaidAdState {
  @override
  List<Object> get props => [];
}

class PaidAdLoading extends PaidAdState {
  @override
  List<Object> get props => [];
}

class PaidAdLoadedSuccess extends PaidAdState {
  final List<Ad> ads;

  const PaidAdLoadedSuccess(this.ads);
  @override
  List<Object> get props => [ads];
}

class PaidAdLoadFailure extends PaidAdState {
  final String error;

  const PaidAdLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
