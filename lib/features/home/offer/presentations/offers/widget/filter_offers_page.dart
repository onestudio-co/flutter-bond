import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/routes/app_router.dart';
import '../../../../widgets/row_selected_filter_widget.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';

// ignore: must_be_immutable
class FilterOfferPage extends StatelessWidget implements AutoRouteWrapper {
  FilterOfferPage({
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

  int? cityId;
  int? userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (BuildContext context, OffersState state) {
        return Container(
          height: TalebSizes.h375,
          width: double.infinity,
          color: TalebColors.ghostWhite,
          child: Padding(
            padding: EdgeInsets.all(TalebPadding.p16),
            child: Column(
              children: <Widget>[
                Text(TalebStrings.offerFilterTitle,
                    style:
                        Theme.of(context).textTheme.bodySmall?.darkJungleGreen),
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
                        title: TalebStrings.offerFilterServiceProviderType,
                        onTap: () async {
                          userId = await context.router
                              .push<int>(const SearchSearviceProviderRoute());
                        },
                      ),
                      const TalebDivider(),
                      RowSelectedFilterWidget(
                          title: TalebStrings.offerFilterCity,
                          onTap: () async {
                            cityId = await context.router
                                .push<int>(const SearchCityRoute());
                          }),
                    ],
                  ),
                ),
                const Spacer(),
                TalebButtonWidget(
                  onPressed: () {
                    context.read<OffersCubit>().loadOffers(
                        cityId: cityId,
                        serviceProviderId: userId,
                        emitLoading: true);
                    cityId = null;
                    userId = null;
                    context.router.pop();
                  },
                  title: 'حفظ',
                ),
                VerticalSpace(TalebSizes.h16),
              ],
            ),
          ),
        );
      },
    );
  }
}
