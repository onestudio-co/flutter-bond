part of 'offers_cubit.dart';

abstract class OffersState extends Equatable {
  final User? user;
  final City? city;

  const OffersState({this.user, this.city});
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
    User? user,
    City? city,
  }) : super(
          user: user,
          city: city,
        );

  User? get selectedUser => user;

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
