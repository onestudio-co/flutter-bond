import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';
import 'package:taleb/features/home/opportunities/data/services/algolia_opportunity_service.dart';

part 'opportunity_state.dart';

class OpportunityCubit extends Cubit<OpportunityState> {
  OpportunityCubit(this._repository, this._algoliaOpportunityService)
      : super(OpportunityInitial());

  final OpportunityRepository _repository;
  final AlgoliaOpportunityService _algoliaOpportunityService;

  Future<void> loadOppertunities(
      {int? cityId, int categoryId = 1, bool emitLoading = false}) async {
    if (emitLoading) {
      emit(OpportunityLoading());
    }

    if (state is OpportunityLoadSuccess) {
      await _loadOppertunitiesNextPage(
        currentState: state as OpportunityLoadSuccess,
      );
    } else {
      await _loadOpportunities(cityId: cityId, categoryId: categoryId);
    }
  }

  Future<void> _loadOpportunities({required int categoryId, int? cityId}) async {
    emit(OpportunityLoading());
    final Either<Failure, ListResponse<Opportunity>> response =
        await _repository.opportunitiesForSpecifiecCategory(
            categoryId: categoryId, cityId: cityId);
    emit(
      response.fold(
          (Failure failure) =>
              OpportunityLoadFailed(error: failure.toMessage()),
          (ListResponse<Opportunity> oppertunities) =>
              oppertunities.data.isEmpty
                  ? OpportunityEmpty()
                  : OpportunityLoadSuccess(oppertunities: oppertunities)),
    );
  }

  Future<void> _loadOppertunitiesNextPage({
    required OpportunityLoadSuccess currentState,
  }) async {
    if (currentState.noMorePages) {
      return;
    }
    if (currentState is OpportunityLoadMoreState) {
      return;
    }

    emit(OpportunityLoadMoreState(
      opportunities: currentState.oppertunities,
    ));

    final Either<Failure, ListResponse<Opportunity>> response =
        await _repository.opportunitiesForSpecifiecCategory(
            nextUrl: currentState.oppertunities.links?.next);

    response.fold(
      (Failure failure) =>
          emit(OpportunityLoadFailed(error: failure.toString())),
      (ListResponse<Opportunity> opportunities) => <void>{
        emit(
          currentState.copyWith(
            opportunities: currentState.oppertunities.copyWith(
              data: currentState.oppertunities.data + opportunities.data,
              links: opportunities.links,
            ),
          ),
        ),
      },
    );
  }

  Future<void> searchNews(String text) async {
    try {
      emit(OpportunityLoading());
      final List<Opportunity> response =
          await _algoliaOpportunityService.searchOpportunity(text);
      ListResponse<Opportunity> listResponse =
          ListResponse<Opportunity>(data: response);
      emit(OpportunityLoadSuccess(oppertunities: listResponse));
    } catch (error) {
      emit(OpportunityLoadFailed(error: error.toString()));
    }
  }
}
