import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/offer/data/repositories/offer_repository.dart';
import 'package:equatable/equatable.dart';

part 'premium_service_provider_state.dart';

class PremiumServiceProviderCubit extends Cubit<PremiumServiceProviderState> {
  final OfferRepository _offerRepository;

  PremiumServiceProviderCubit(this._offerRepository)
      : super(PremiumServiceProviderInitial());

  void getPremiumServiceProvider() async {
    emit(PremiumServiceProviderLoading());
    final Either<Failure, ListResponse<User>> response =
        await _offerRepository.getPremiumServiceProvider();
    response.fold(
      (Failure failure) =>
          emit(PremiumServiceProviderLoadFailure(failure.toMessage())),
      (ListResponse<User> response) {
        emit(PremiumServiceProviderLoadedSuccess(response.data));
      },
    );
  }
}
