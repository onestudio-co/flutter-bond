import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/city/data/repositories/city_repository.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityRepository _cityRepository;

  CityCubit(this._cityRepository) : super(CityInitialState());

  void getCitys({String? textSearch}) async {
    emit(CityLoadingState());

    final Either<Failure, ListResponse<City>> response =
        await _cityRepository.getCities(textSearch: textSearch);
    response.fold(
      (Failure failure) => emit(CityLoadFailure(failure.toMessage())),
      (ListResponse<City> response) {
        emit(CityLoadedSuccessState(response.data));
      },
    );
  }
}
