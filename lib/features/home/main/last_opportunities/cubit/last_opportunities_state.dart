part of 'last_opportunities_cubit.dart';

abstract class LastOpportunitiesState extends Equatable {
  const LastOpportunitiesState();

  @override
  List<Object> get props => [];
}

class LastOpportunitiesInitial extends LastOpportunitiesState {
  @override
  List<Object> get props => [];
}

class LastOpportunitiesLoading extends LastOpportunitiesState {
  @override
  List<Object> get props => [];
}

class LastOpportunitiesEmptyData extends LastOpportunitiesState {
  @override
  List<Object> get props => [];
}

class LastOpportunitiesLoadedSuccess extends LastOpportunitiesState {
  final List<Opportunity> opportunities;

  const LastOpportunitiesLoadedSuccess(this.opportunities);
  @override
  List<Object> get props => [opportunities];
}

class LastOfferLoadFailure extends LastOpportunitiesState {
  final String error;

  const LastOfferLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
