import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/title_filter_and_clear_button.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/service_provider_category/data/models/service_provider_category.dart';
import 'package:taleb/routes/app_router.dart';

import '../../../../widgets/row_selected_filter_widget.dart';

// ignore: must_be_immutable
class FilterOfferPage extends StatelessWidget implements AutoRouteWrapper {
  const FilterOfferPage({
    required this.offersCubit,
    Key? key,
  }) : super(key: key);

  final OffersCubit offersCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OffersCubit>.value(
      value: offersCubit,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (BuildContext context, OffersState state) {
        if (state is OffersLoadSuccess) {
          return Container(
            height: TalebSizes.h375,
            width: double.infinity,
            color: TalebColors.ghostWhite,
            child: Padding(
              padding: EdgeInsets.all(TalebPadding.p16),
              child: Column(
                children: <Widget>[
                  TitleFilterAndClearButton(
                      onPressClear: () =>
                          _clearFilterResult(context, offersCubit)),
                  VerticalSpace(TalebSizes.h20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(TalebStrings.offerFilterDescription,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.darkJungleGreen),
                  ),
                  VerticalSpace(TalebSizes.h8),
                  TalebContainer(
                    child: Column(
                      children: <Widget>[
                        RowSelectedFilterWidget(
                          title: state.serviceProviderCategory?.name ??
                              TalebStrings.offerFilterServiceProviderType,
                          isSlected: state.serviceProviderCategory != null,
                          onTap: () =>
                              _updateServiceProvider(context, offersCubit),
                        ),
                        const TalebDivider(),
                        RowSelectedFilterWidget(
                            title: state.city?.name ??
                                TalebStrings.offerFilterCity,
                            isSlected: state.city != null,
                            onTap: () => _updateCity(context, offersCubit)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  TalebButtonWidget(
                    enable: state.isSlectedNotNull,
                    onPressed: () {
                      context.read<OffersCubit>().loadOffers(
                          cityId: state.city?.id,
                          serviceProviderCategoryId:
                              state.selectedServiceProviderCategory?.id,
                          emitLoading: true);
                      context.router.pop();
                    },
                    title: TalebStrings.saveButton,
                  ),
                  VerticalSpace(TalebSizes.h16),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _updateServiceProvider(
      BuildContext context, OffersCubit offersCubit) async {
    final serviceProviderCategory = await context.router
        .push<ServiceProviderCategory>(const ServiceProviderCategoriesRoute());

    offersCubit.selectCategoryAndCity(
        serviceProviderCategory: serviceProviderCategory);
  }

  void _updateCity(BuildContext context, OffersCubit offersCubit) async {
    final city = await context.router.push<City>(const SearchCityRoute());

    offersCubit.selectCategoryAndCity(city: city);
  }

  void _clearFilterResult(BuildContext context, OffersCubit offersCubit) async {
    offersCubit.clearFilterResult();
  }
}
