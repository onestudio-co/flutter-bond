import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/features/home/offer/data/repositories/offer_repository.dart';

part 'last_offers_state.dart';

class LastOffersCubit extends Cubit<LastOffersState> {
  final OfferRepository _offerRepository;

  LastOffersCubit(this._offerRepository) : super(LastOffersInitial());

  void lastOffers() async {
    emit(LastOffersLoading());
    final Either<Failure, ListResponse<Offer>> response =
        await _offerRepository.lastOffers();
    response.fold(
      (Failure failure) => emit(LastOfferLoadFailure(failure.toMessage())),
      (ListResponse<Offer> response) {
        emit(
          response.data.isEmpty
              ? LastOffersEmptyData()
              : LastOffersLoadedSuccess(response.data),
        );
      },
    );
  }
}
