part of 'premium_service_provider_cubit.dart';

abstract class PremiumServiceProviderState extends Equatable {
  const PremiumServiceProviderState();

  @override
  List<Object> get props => [];
}

class PremiumServiceProviderInitial extends PremiumServiceProviderState {
  @override
  List<Object> get props => [];
}

class PremiumServiceProviderLoading extends PremiumServiceProviderState {
  @override
  List<Object> get props => [];
}

class PremiumServiceProviderLoadedSuccess extends PremiumServiceProviderState {
  final List<User> users;

  const PremiumServiceProviderLoadedSuccess(this.users);
  @override
  List<Object> get props => [users];
}

class PremiumServiceProviderLoadFailure extends PremiumServiceProviderState {
  final String error;

  const PremiumServiceProviderLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
