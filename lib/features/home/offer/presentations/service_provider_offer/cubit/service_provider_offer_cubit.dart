import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/features/home/offer/data/repositories/offer_repository.dart';

part 'service_provider_offer_state.dart';

class ServiceProviderOfferCubit extends Cubit<ServiceProviderOfferState> {
  ServiceProviderOfferCubit(this._repository)
      : super(ServiceProviderOfferInitial());

  final OfferRepository _repository;

  Future<void> loadServiceProviderOffer({int? serviceProviderId}) async {
    if (state is ServiceProviderOfferLoadSuccess) {
      await _loadOfferNextPage(
        currentState: state as ServiceProviderOfferLoadSuccess,
      );
    } else {
      await _loadOffer(serviceProviderId: serviceProviderId);
    }
  }

  Future<void> _loadOffer({int? serviceProviderId}) async {
    emit(ServiceProviderOfferLoading());
    final Either<Failure, ListResponse<Offer>> response = await _repository
        .allServiceProviderOffer(serviceProviderId: serviceProviderId);
    emit(
      response.fold(
          (Failure failure) =>
              ServiceProviderOfferLoadFailed(error: failure.toMessage()),
          (ListResponse<Offer> offer) => offer.data.isEmpty
              ? ServiceProviderOfferEmpty()
              : ServiceProviderOfferLoadSuccess(offer: offer)),
    );
  }

  Future<void> _loadOfferNextPage({
    required ServiceProviderOfferLoadSuccess currentState,
  }) async {
    if (currentState.noMorePages) {
      return;
    }
    if (currentState is ServiceProviderOfferLoadMoreState) {
      return;
    }

    emit(ServiceProviderOfferLoadMoreState(
      offer: currentState.offer,
    ));

    final Either<Failure, ListResponse<Offer>> response =
        await _repository.allOffer(nextUrl: currentState.offer.links?.next);

    response.fold(
      (Failure failure) =>
          emit(ServiceProviderOfferLoadFailed(error: failure.toString())),
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
}
