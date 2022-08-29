import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/service_provider/data/repositories/service_provider_repository.dart';

part 'partner_state.dart';

class PartnerCubit extends Cubit<PartnerState> {
  final ServiceProviderRepository _repository;

  PartnerCubit(this._repository)
      : super(PartnerInitialState());

  void getPartners({String? textSearch}) async {
    emit(PartnerLoadingState());

    final Either<Failure, ListResponse<User>> response =
        await _repository.getPartners(textSearch: textSearch);
    response.fold(
      (Failure failure) =>
          emit(PartnerLoadFailure(failure.toMessage())),
      (ListResponse<User> response) {
        emit(PartnerLoadedSuccessState(response.data));
      },
    );
  }
}
