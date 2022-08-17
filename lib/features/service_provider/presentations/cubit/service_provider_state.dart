part of 'service_provider_cubit.dart';

abstract class ServiceProviderState extends Equatable {
  const ServiceProviderState();
}

class ServiceProviderInitialState extends ServiceProviderState {
  @override
  List<Object> get props => [];
}

class ServiceProviderLoadingState extends ServiceProviderState {
  @override
  List<Object> get props => [];
}

class ServiceProviderLoadedSuccessState extends ServiceProviderState {
  final List<User> serviceProviders;

  const ServiceProviderLoadedSuccessState(this.serviceProviders);
  @override
  List<Object> get props => [serviceProviders];
}

class ServiceProviderLoadFailure extends ServiceProviderState {
  final String error;

  const ServiceProviderLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
