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
  final ListResponse<Offer> offers;
  final ServiceProviderCategory? serviceProviderCategory;
  final City? city;

  const OffersLoadSuccess({
    required this.offers,
    this.serviceProviderCategory,
    this.city,
  });

  ServiceProviderCategory? get selectedServiceProviderCategory =>
      serviceProviderCategory;

  City? get selectedCity => city;

  bool get isSlectedNotNull =>
      selectedServiceProviderCategory != null || selectedCity != null;

  OffersLoadSuccess clearSelected() {
    return OffersLoadSuccess(
        offers: offers, city: null, serviceProviderCategory: null);
  }

  bool get noMorePages => offers.links?.next == null;

  OffersLoadSuccess copyWith({
    ListResponse<Offer>? offer,
    ServiceProviderCategory? serviceProviderCategory,
    City? city,
  }) {
    return OffersLoadSuccess(
      offers: offer ?? offers,
      serviceProviderCategory:
          serviceProviderCategory ?? this.serviceProviderCategory,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props => [offers, serviceProviderCategory, city];
}

class OffersLoadMoreState extends OffersLoadSuccess {
  const OffersLoadMoreState({
    required ListResponse<Offer> offer,
    ServiceProviderCategory? serviceProviderCategory,
    City? city,
  }) : super(
            offers: offer,
            serviceProviderCategory: serviceProviderCategory,
            city: city);

  @override
  List<Object?> get props => [offers, serviceProviderCategory, city];
}

class OffersLoadFailed extends OffersState {
  final String error;

  const OffersLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
