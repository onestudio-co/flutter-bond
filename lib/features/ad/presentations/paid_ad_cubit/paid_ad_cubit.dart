import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/ad/data/models/ad.dart';
import 'package:taleb/features/ad/data/repositories/ad_repository.dart';

part 'paid_ad_state.dart';

class PaidAdCubit extends Cubit<PaidAdState> {
  final AdRepository _addRepository;

  PaidAdCubit(this._addRepository) : super(PaidAdInitial());

  void getPaidAds() async {
    emit(PaidAdLoading());

    final Either<Failure, ListResponse<Ad>> response =
        await _addRepository.getPaidAds();
    response.fold(
      (Failure failure) => emit(PaidAdLoadFailure(failure.toMessage())),
      (ListResponse<Ad> response) {
        emit(PaidAdLoadedSuccess(response.data));
      },
    );
  }
}
