part of 'similer_opportunity_cubit.dart';

abstract class SimilerOpportunityState extends Equatable {
  const SimilerOpportunityState();

  @override
  List<Object> get props => [];
}

class SimilerOpportunityInitial extends SimilerOpportunityState {
  @override
  List<Object> get props => [];
}

class SimilerOpportunityLoading extends SimilerOpportunityState {
  @override
  List<Object> get props => [];
}

class SimilerOpportunityLoadedSuccess extends SimilerOpportunityState {
  final List<Opportunity> opportunities;

  const SimilerOpportunityLoadedSuccess(this.opportunities);
  @override
  List<Object> get props => [opportunities];
}

class SimilerOpportunityLoadFailure extends SimilerOpportunityState {
  final String error;

  const SimilerOpportunityLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
