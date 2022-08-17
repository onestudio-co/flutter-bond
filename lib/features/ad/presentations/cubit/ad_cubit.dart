import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/ad/data/models/ad.dart';
import 'package:taleb/features/ad/data/repositories/ad_repository.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  final AdRepository _addRepository;

  AdCubit(this._addRepository) : super(AdInitialState());

  List<Ad> _ads = [];

  List<Ad> get ads => _ads;

  void getAds() async {
    log('message');
    emit(AdLoadingState());
    final Either<Failure, ListResponse<Ad>> response =
        await _addRepository.getAds();
    log(response.toString());
    response.fold(
      (Failure failure) => emit(AdLoadFailure(failure.toMessage())),
      (ListResponse<Ad> response) {
        _ads = response.data;
        emit(AdLoadedSuccessState(response.data));
      },
    );
  }
}
