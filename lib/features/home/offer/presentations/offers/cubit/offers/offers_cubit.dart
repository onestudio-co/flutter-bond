import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this._repository, this.algoliaOffersService)
      : super(OffersInitial());

  final OfferRepository _repository;
  final AlgoliaOfferService algoliaOffersService;

  Future<void> loadOffers(
      {int? cityId, int? serviceProviderId, bool emitLoading = false}) async {
    if (emitLoading) {
      emit(OffersLoading());
    }

    if (state is OffersLoadSuccess) {
      await _loadOfferNextPage(
        currentState: state as OffersLoadSuccess,
      );
    } else {
      await _loadOffer(cityId: cityId, serviceProviderId: serviceProviderId);
    }
  }

  Future<void> _loadOffer({int? cityId, int? serviceProviderId}) async {
    emit(OffersLoading());
    final Either<Failure, ListResponse<Offer>> response = await _repository
        .allOffers(cityId: cityId, serviceProviderId: serviceProviderId);
    emit(
      response.fold(
          (Failure failure) => OffersLoadFailed(error: failure.toMessage()),
          (ListResponse<Offer> offer) => offer.data.isEmpty
              ? OffersEmpty()
              : OffersLoadSuccess(offer: offer)),
    );
  }

  Future<void> _loadOfferNextPage({
    required OffersLoadSuccess currentState,
  }) async {
    if (currentState.noMorePages) {
      return;
    }
    if (currentState is OffersLoadMoreState) {
      return;
    }

    emit(OffersLoadMoreState(
      offer: currentState.offer,
    ));

    final Either<Failure, ListResponse<Offer>> response =
        await _repository.allOffers(nextUrl: currentState.offer.links?.next);

    response.fold(
      (Failure failure) => emit(OffersLoadFailed(error: failure.toString())),
      (ListResponse<Offer> offer) => <void>{
        emit(
          currentState.copyWith(
            offer: currentState.offer.copyWith(
              data: currentState.offer.data + offer.data,
              links: offer.links,
            ),
          ),
        ),
      },
    );
  }

  // Future<void> searchOffer(String text) async {
  //   try {
  //     emit(OfferLoading());
  //     final List<Offer> response =
  //         await algoliaSubspecialtiesService.searchOffer(text);
  //     ListResponse<Offer> listResponse = ListResponse<Offer>(data: response);
  //     emit(OfferLoadSuccess(offer: listResponse));
  //   } catch (error) {
  //     emit(OfferLoadFailed(error: error.toString()));
  //   }
  // }

  Future<void> searchOffer(String text) async {
    emit(OffersLoading());
    final Either<Failure, ListResponse<Offer>> response =
        await _repository.searchOffer(text: text);
    emit(
      response.fold(
          (Failure failure) => OffersLoadFailed(error: failure.toMessage()),
          (ListResponse<Offer> offer) => offer.data.isEmpty
              ? OffersEmpty()
              : OffersLoadSuccess(offer: offer)),
    );
  }

  void selectUser({User? user}) {
    if (state is OffersLoadSuccess) {
      final currentState = state as OffersLoadSuccess;
      emit(currentState.copyWith(user: user));
      logger.d(user?.name);
    }
  }
}
