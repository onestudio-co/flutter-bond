import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';
import 'package:taleb/features/home/opportunities/data/repositories/opportunity_repository.dart';

part 'opportunity_category_state.dart';

class OpportunityCategoryCubit extends Cubit<OpportunityCategoryState> {
  OpportunityCategoryCubit(this._opportunityRepository)
      : super(OpportunityCategoryInitial());

  final OpportunityRepository _opportunityRepository;

  void allCategories() async {
    emit(OpportunityCategoryLoading());
    final Either<Failure, ListResponse<OpportunityCategory>> response =
        await _opportunityRepository.allCategories();
    response.fold(
      (Failure failure) =>
          emit(OpportunityCategoryLoadFailure(failure.toMessage())),
      (ListResponse<OpportunityCategory> response) {
        emit(OpportunityCategoryLoadedSuccess(response.data));
      },
    );
  }
}
