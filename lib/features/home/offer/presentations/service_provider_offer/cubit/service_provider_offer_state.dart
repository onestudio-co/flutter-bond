part of 'service_provider_offer_cubit.dart';

abstract class ServiceProviderOfferState extends Equatable {}

class ServiceProviderOfferInitial extends ServiceProviderOfferState {
  @override
  List<Object?> get props => [];
}

class ServiceProviderOfferLoading extends ServiceProviderOfferState {
  @override
  List<Object?> get props => [];
}

class ServiceProviderOfferEmpty extends ServiceProviderOfferState {
  ServiceProviderOfferEmpty();

  @override
  List<Object?> get props => [];
}

class ServiceProviderOfferLoadSuccess extends ServiceProviderOfferState {
  final ListResponse<Offer> offer;

  ServiceProviderOfferLoadSuccess({required this.offer});

  bool get noMorePages => offer.links?.next == null;

  @override
  List<Object?> get props => [offer];

  ServiceProviderOfferLoadSuccess copyWith({
    ListResponse<Offer>? offer,
  }) {
    return ServiceProviderOfferLoadSuccess(
      offer: offer ?? this.offer,
    );
  }
}

class ServiceProviderOfferLoadMoreState extends ServiceProviderOfferLoadSuccess {
  ServiceProviderOfferLoadMoreState({
    required ListResponse<Offer> offer,
  }) : super(offer: offer);

  @override
  List<Object> get props => [offer];
}

class ServiceProviderOfferLoadFailed extends ServiceProviderOfferState {
  final String error;

  ServiceProviderOfferLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
