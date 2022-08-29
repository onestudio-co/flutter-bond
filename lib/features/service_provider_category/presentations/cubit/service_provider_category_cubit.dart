import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/service_provider_category/imports.dart';

part 'service_provider_category_state.dart';

class ServiceProviderCategoryCubit extends Cubit<ServiceProviderCategoryState> {
  final ServiceProviderCategoryRepository _cityRepository;

  ServiceProviderCategoryCubit(this._cityRepository)
      : super(ServiceProviderCategoryInitialState());

  void getServiceProviderCategorys({String? textSearch}) async {
    emit(ServiceProviderCategoryLoadingState());

    final Either<Failure, ListResponse<ServiceProviderCategory>> response =
        await _cityRepository.getServiceProviderCategories(
            textSearch: textSearch);
    response.fold(
      (Failure failure) =>
          emit(ServiceProviderCategoryLoadFailure(failure.toMessage())),
      (ListResponse<ServiceProviderCategory> response) {
        emit(ServiceProviderCategoryLoadedSuccessState(response.data));
      },
    );
  }
}
