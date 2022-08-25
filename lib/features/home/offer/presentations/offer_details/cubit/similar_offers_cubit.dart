import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/features/home/offer/data/repositories/offer_repository.dart';

part 'similar_offers_state.dart';

class SimilarCubit extends Cubit<SimilarOffersState> {
  final OfferRepository _offerRepository;

  SimilarCubit(this._offerRepository) : super(SimilarOffersInitial());

  void similarOffer(int offerId) async {
    emit(SimilarOffersLoading());
    final Either<Failure, ListResponse<Offer>> response =
        await _offerRepository.similerOffer(offerId);
    response.fold(
      (Failure failure) => emit(SimilarOfferLoadFailure(failure.toMessage())),
      (ListResponse<Offer> response) {
        emit(SimilarOffersLoadedSuccess(response.data));
      },
    );
  }
}
