part of 'partner_cubit.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();
}

class PartnerInitialState extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoadingState extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoadedSuccessState extends PartnerState {
  final List<User> serviceProviders;

  const PartnerLoadedSuccessState(this.serviceProviders);
  @override
  List<Object> get props => [serviceProviders];
}

class PartnerLoadFailure extends PartnerState {
  final String error;

  const PartnerLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
