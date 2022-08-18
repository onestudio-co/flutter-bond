import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';

part 'similer_opportunity_state.dart';

class SimilerOpportunityCubit extends Cubit<SimilerOpportunityState> {
  final OpportunityRepository _opportunityRepository;

  SimilerOpportunityCubit(this._opportunityRepository)
      : super(SimilerOpportunityInitial());

  void similerOpportunities(int opportunityId) async {
    emit(SimilerOpportunityLoading());
    final Either<Failure, ListResponse<Opportunity>> response =
        await _opportunityRepository.similerOpportunities(opportunityId);
    response.fold(
      (Failure failure) =>
          emit(SimilerOpportunityLoadFailure(failure.toMessage())),
      (ListResponse<Opportunity> response) {
        emit(SimilerOpportunityLoadedSuccess(response.data));
      },
    );
  }
}
