part of 'offers_cubit.dart';

abstract class OffersState extends Equatable {
  final ServiceProviderCategory? serviceProviderCategory;
  final City? city;

  const OffersState({this.serviceProviderCategory, this.city});
}

class OffersInitial extends OffersState {
  @override
  List<Object?> get props => [];
}

class OffersLoading extends OffersState {
  @override
  List<Object?> get props => [];
}

class OffersEmpty extends OffersState {
  const OffersEmpty();

  @override
  List<Object?> get props => [];
}

class OffersLoadSuccess extends OffersState {
  final ListResponse<Offer> offer;

  const OffersLoadSuccess({
    required this.offer,
    ServiceProviderCategory? serviceProviderCategory,
    City? city,
  }) : super(
          serviceProviderCategory: serviceProviderCategory,
          city: city,
        );

  ServiceProviderCategory? get selectedServiceProviderCategory =>
      serviceProviderCategory;

  bool get noMorePages => offer.links?.next == null;

  @override
  List<Object?> get props => [offer];

  OffersLoadSuccess copyWith({
    ListResponse<Offer>? offer,
    ServiceProviderCategory? serviceProviderCategory,
    City? city,
  }) {
    return OffersLoadSuccess(
      offer: offer ?? this.offer,
      serviceProviderCategory:
          serviceProviderCategory ?? this.serviceProviderCategory,
      city: city ?? this.city,
    );
  }
}

class OffersLoadMoreState extends OffersLoadSuccess {
  const OffersLoadMoreState({
    required ListResponse<Offer> offer,
  }) : super(offer: offer);

  @override
  List<Object> get props => [offer];
}

class OffersLoadFailed extends OffersState {
  final String error;

  const OffersLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
