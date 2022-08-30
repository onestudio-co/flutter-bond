import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';

part 'last_opportunities_state.dart';

class LastOpportunitiesCubit extends Cubit<LastOpportunitiesState> {
  final OpportunityRepository _repository;

  LastOpportunitiesCubit(this._repository) : super(LastOpportunitiesInitial());

  void lastOpportunities() async {
    emit(LastOpportunitiesLoading());
    final Either<Failure, ListResponse<Opportunity>> response =
        await _repository.lastOpportunities();
    response.fold(
      (Failure failure) => emit(LastOfferLoadFailure(failure.toMessage())),
      (ListResponse<Opportunity> response) {
        emit(
          response.data.isEmpty
              ? LastOpportunitiesEmptyData()
              : LastOpportunitiesLoadedSuccess(response.data),
        );
      },
    );
  }
}
