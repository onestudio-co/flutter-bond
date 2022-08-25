part of 'similar_offers_cubit.dart';

abstract class SimilarOffersState extends Equatable {
  const SimilarOffersState();

  @override
  List<Object> get props => [];
}

class SimilarOffersInitial extends SimilarOffersState {
  @override
  List<Object> get props => [];
}

class SimilarOffersLoading extends SimilarOffersState {
  @override
  List<Object> get props => [];
}

class SimilarOffersLoadedSuccess extends SimilarOffersState {
  final List<Offer> offer;

  const SimilarOffersLoadedSuccess(this.offer);
  @override
  List<Object> get props => [offer];
}

class SimilarOfferLoadFailure extends SimilarOffersState {
  final String error;

  const SimilarOfferLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
