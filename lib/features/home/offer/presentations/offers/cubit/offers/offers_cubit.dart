import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/service_provider_category/data/models/service_provider_category.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this._repository, this._algoliaOffersService)
      : super(OffersInitial());

  final OfferRepository _repository;
  final AlgoliaOfferService _algoliaOffersService;

  Future<void> loadOffers(
      {int? cityId,
      int? serviceProviderCategoryId,
      bool emitLoading = false}) async {
    if (emitLoading) {
      emit(OffersLoading());
    }

    if (state is OffersLoadSuccess) {
      await _loadOfferNextPage(
        currentState: state as OffersLoadSuccess,
      );
    } else {
      await _loadOffer(
          cityId: cityId, serviceProviderCategoryId: serviceProviderCategoryId);
    }
  }

  Future<void> _loadOffer({int? cityId, int? serviceProviderCategoryId}) async {
    emit(OffersLoading());
    final Either<Failure, ListResponse<Offer>> response =
        await _repository.allOffers(
            cityId: cityId,
            serviceProviderCategoryId: serviceProviderCategoryId);
    emit(
      response.fold(
          (Failure failure) => OffersLoadFailed(error: failure.toMessage()),
          (ListResponse<Offer> offer) => offer.data.isEmpty
              ? const OffersEmpty()
              : OffersLoadSuccess(offers: offer)),
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
      offer: currentState.offers,
    ));

    final Either<Failure, ListResponse<Offer>> response =
        await _repository.allOffers(nextUrl: currentState.offers.links?.next);

    response.fold(
      (Failure failure) => emit(OffersLoadFailed(error: failure.toString())),
      (ListResponse<Offer> offer) => <void>{
        emit(
          currentState.copyWith(
            offer: currentState.offers.copyWith(
              data: currentState.offers.data + offer.data,
              links: offer.links,
            ),
          ),
        ),
      },
    );
  }

  Future<void> searchOffer({
    required String text,
    int? cityId,
    int? serviceProviderCategoryId,
  }) async {
    try {
      emit(OffersLoading());
      final List<Offer> response = await _algoliaOffersService.searchOffer(
        text: text,
        cityId: cityId,
        serviceProviderCategoryId: serviceProviderCategoryId,
      );
      ListResponse<Offer> listResponse = ListResponse<Offer>(data: response);
      emit(OffersLoadSuccess(offers: listResponse));
    } catch (error) {
      emit(OffersLoadFailed(error: error.toString()));
    }
  }

  // Future<void> searchOffer({
  //   required String text,
  //   int? cityId,
  //   int? serviceProviderCategoryId,
  // }) async {
  //   emit(OffersLoading());
  //   final Either<Failure, ListResponse<Offer>> response =
  //       await _repository.searchOffer(text: text);
  //   emit(
  //     response.fold(
  //         (Failure failure) => OffersLoadFailed(error: failure.toMessage()),
  //         (ListResponse<Offer> offer) => offer.data.isEmpty
  //             ? const OffersEmpty()
  //             : OffersLoadSuccess(offers: offer)),
  //   );
  // }

  void selectCategoryAndCity(
      {ServiceProviderCategory? serviceProviderCategory, City? city}) {
    if (state is OffersLoadSuccess) {
      final currentState = state as OffersLoadSuccess;
      emit(currentState.copyWith(
          serviceProviderCategory: serviceProviderCategory, city: city));
    }
  }

  void clearFilterResult() {
    if (state is OffersLoadSuccess) {
      final currentState = state as OffersLoadSuccess;
      emit(currentState.clearSelected());
    }
  }
}
