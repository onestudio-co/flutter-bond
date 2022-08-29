import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/service_provider/data/repositories/service_provider_repository.dart';

part 'service_provider_state.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  final ServiceProviderRepository _repository;

  ServiceProviderCubit(this._repository)
      : super(ServiceProviderInitialState());

  void getServiceProviders({String? textSearch}) async {
    emit(ServiceProviderLoadingState());

    final Either<Failure, ListResponse<User>> response =
        await _repository.getServiceProviders(textSearch: textSearch);
    response.fold(
      (Failure failure) =>
          emit(ServiceProviderLoadFailure(failure.toMessage())),
      (ListResponse<User> response) {
        emit(ServiceProviderLoadedSuccessState(response.data));
      },
    );
  }
}
