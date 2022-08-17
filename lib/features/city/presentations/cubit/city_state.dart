part of 'city_cubit.dart';

abstract class CityState extends Equatable {
  const CityState();
}

class CityInitialState extends CityState {
  @override
  List<Object> get props => [];
}

class CityLoadingState extends CityState {
  @override
  List<Object> get props => [];
}

class CityLoadedSuccessState extends CityState {
  final List<City> cities;

  const CityLoadedSuccessState(this.cities);
  @override
  List<Object> get props => [cities];
}

class CityLoadFailure extends CityState {
  final String error;

  const CityLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
