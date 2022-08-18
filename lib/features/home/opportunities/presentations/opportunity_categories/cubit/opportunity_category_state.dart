part of 'opportunity_category_cubit.dart';

abstract class OpportunityCategoryState extends Equatable {
  const OpportunityCategoryState();

  @override
  List<Object> get props => [];
}

class OpportunityCategoryInitial extends OpportunityCategoryState {}

class OpportunityCategoryLoading extends OpportunityCategoryState {}

class OpportunityCategoryLoadedSuccess extends OpportunityCategoryState {
  final List<OpportunityCategory> categories;

  const OpportunityCategoryLoadedSuccess(this.categories);
  @override
  List<Object> get props => [categories];
}

class OpportunityCategoryLoadFailure extends OpportunityCategoryState {
  final String error;

  const OpportunityCategoryLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
