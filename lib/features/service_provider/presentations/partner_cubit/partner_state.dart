part of 'partner_cubit.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();
}

class PartnerInitial extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoading extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoadedSuccess extends PartnerState {
  final List<User> serviceProviders;

  const PartnerLoadedSuccess(this.serviceProviders);
  @override
  List<Object> get props => [serviceProviders];
}

class PartnerLoadFailure extends PartnerState {
  final String error;

  const PartnerLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
