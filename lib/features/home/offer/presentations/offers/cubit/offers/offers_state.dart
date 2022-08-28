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

  OffersLoadSuccess({required this.offer});

  bool get noMorePages => offer.links?.next == null;

  @override
  List<Object?> get props => [offer];

  OffersLoadSuccess copyWith({
    ListResponse<Offer>? offer,
  }) {
    return OffersLoadSuccess(
      offer: offer ?? this.offer,
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
