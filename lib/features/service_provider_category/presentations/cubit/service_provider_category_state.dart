part of 'service_provider_category_cubit.dart';

abstract class ServiceProviderCategoryState extends Equatable {
  const ServiceProviderCategoryState();
}

class ServiceProviderCategoryInitialState extends ServiceProviderCategoryState {
  @override
  List<Object> get props => [];
}

class ServiceProviderCategoryLoadingState extends ServiceProviderCategoryState {
  @override
  List<Object> get props => [];
}
class ServiceProviderCategoryEmptyData extends ServiceProviderCategoryState {
  @override
  List<Object> get props => [];
}

class ServiceProviderCategoryLoadedSuccessState
    extends ServiceProviderCategoryState {
  final List<ServiceProviderCategory> serviceProviderCategories;

  const ServiceProviderCategoryLoadedSuccessState(
      this.serviceProviderCategories);
  @override
  List<Object> get props => [serviceProviderCategories];
}

class ServiceProviderCategoryLoadFailure extends ServiceProviderCategoryState {
  final String error;

  const ServiceProviderCategoryLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
