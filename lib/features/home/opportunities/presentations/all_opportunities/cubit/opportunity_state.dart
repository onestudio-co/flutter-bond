part of 'opportunity_cubit.dart';

abstract class OpportunityState extends Equatable {}

class OpportunityInitial extends OpportunityState {
  @override
  List<Object?> get props => [];
}

class OpportunityLoading extends OpportunityState {
  @override
  List<Object?> get props => [];
}

class OpportunityEmpty extends OpportunityState {
  OpportunityEmpty();

  @override
  List<Object?> get props => [];
}

class OpportunityLoadSuccess extends OpportunityState {
  final ListResponse<Opportunity> oppertunities;

  OpportunityLoadSuccess({required this.oppertunities});

  bool get noMorePages => oppertunities.links?.next == null;

  @override
  List<Object?> get props => [oppertunities];

  OpportunityLoadSuccess copyWith({
    ListResponse<Opportunity>? opportunities,
  }) {
    return OpportunityLoadSuccess(
      oppertunities: opportunities ?? oppertunities,
    );
  }
}

class OpportunityLoadMoreState extends OpportunityLoadSuccess {
  OpportunityLoadMoreState({
    required ListResponse<Opportunity> opportunities,
  }) : super(oppertunities: opportunities);

  @override
  List<Object> get props => [oppertunities];
}

class OpportunityLoadFailed extends OpportunityState {
  final String error;

  OpportunityLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
