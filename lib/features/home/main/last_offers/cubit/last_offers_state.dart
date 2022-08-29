part of 'last_offers_cubit.dart';

abstract class LastOffersState extends Equatable {
  const LastOffersState();

  @override
  List<Object> get props => [];
}

class LastOffersInitial extends LastOffersState {
  @override
  List<Object> get props => [];
}

class LastOffersLoading extends LastOffersState {
  @override
  List<Object> get props => [];
}

class LastOffersEmptyData extends LastOffersState {
  @override
  List<Object> get props => [];
}

class LastOffersLoadedSuccess extends LastOffersState {
  final List<Offer> offer;

  const LastOffersLoadedSuccess(this.offer);
  @override
  List<Object> get props => [offer];
}

class LastOfferLoadFailure extends LastOffersState {
  final String error;

  const LastOfferLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
