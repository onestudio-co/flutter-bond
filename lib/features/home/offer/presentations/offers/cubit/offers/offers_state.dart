part of 'offers_cubit.dart';

abstract class OffersState extends Equatable {
  const OffersState();
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
  final ServiceProviderCategory? serviceProviderCategory;
  final City? city;

  const OffersLoadSuccess({
    required this.offer,
    this.serviceProviderCategory,
    this.city,
  });

  ServiceProviderCategory? get selectedServiceProviderCategory =>
      serviceProviderCategory;

  City? get selectedCity => city;

  bool get isSlectedNotNull =>
      selectedServiceProviderCategory != null || selectedCity != null;

  bool get noMorePages => offer.links?.next == null;

  @override
  List<Object?> get props => [offer, serviceProviderCategory, city];

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
    ServiceProviderCategory? serviceProviderCategory,
    City? city,
  }) : super(
            offer: offer,
            serviceProviderCategory: serviceProviderCategory,
            city: city);

  @override
  List<Object?> get props => [offer, serviceProviderCategory, city];
}

class OffersLoadFailed extends OffersState {
  final String error;

  const OffersLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
