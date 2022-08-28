part of 'offers_cubit.dart';

abstract class OffersState extends Equatable {}

class OffersInitial extends OffersState {
  @override
  List<Object?> get props => [];
}

class OffersLoading extends OffersState {
  @override
  List<Object?> get props => [];
}

class OffersEmpty extends OffersState {
  OffersEmpty();

  @override
  List<Object?> get props => [];
}

class OffersLoadSuccess extends OffersState {
  final ListResponse<Offer> offer;
  final User? user;
  final City? city;

  OffersLoadSuccess({
    required this.offer,
    this.user,
    this.city,
  });

  bool get noMorePages => offer.links?.next == null;

  @override
  List<Object?> get props => [offer];

  OffersLoadSuccess copyWith({
    ListResponse<Offer>? offer,
    User? user,
    City? city,
  }) {
    return OffersLoadSuccess(
      offer: offer ?? this.offer,
      user: user ?? this.user,
      city: city ?? this.city,
    );
  }
}

class OffersLoadMoreState extends OffersLoadSuccess {
  OffersLoadMoreState({
    required ListResponse<Offer> offer,
  }) : super(offer: offer);

  @override
  List<Object> get props => [offer];
}

class OffersLoadFailed extends OffersState {
  final String error;

  OffersLoadFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
