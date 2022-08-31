import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/title_filter_and_clear_button.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/news/presentations/all_news/cubit/news_cubit.dart';
import 'package:taleb/routes/app_router.dart';

import '../../../../widgets/row_selected_filter_widget.dart';

class FilterNewsPage extends StatelessWidget implements AutoRouteWrapper {
  const FilterNewsPage({
    required this.newsCubit,
    Key? key,
  }) : super(key: key);

  final NewsCubit newsCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NewsCubit>.value(
      value: newsCubit,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (BuildContext context, NewsState state) {
        // if (state is NewsLoadSuccess) {
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
                          _clearFilterResult(context, newsCubit)),
                  VerticalSpace(TalebSizes.h20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(TalebStrings.filterNewsDescription,
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
                          title: state.serviceProvider?.name ??
                              TalebStrings.filterNewsPublisher,
                          onTap: () =>
                              _selectServiceProvider(context, newsCubit),
                          isSlected: state.serviceProvider != null,
                        ),
                        const TalebDivider(),
                        RowSelectedFilterWidget(
                          title:
                              state.city?.name ?? TalebStrings.filterNewsCity,
                          onTap: () => _selectCity(context, newsCubit),
                          isSlected: state.city != null,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  TalebButtonWidget(
                    title: TalebStrings.saveButton,
                    onPressed: () {
                      context.read<NewsCubit>().loadNews(
                          cityId: state.city?.id,
                          searviceProviderId: state.selectedServiceProvider?.id,
                          emitLoading: true);
                      context.router.pop();
                    },
                    enable: state.isSlectedNotNull,
                  ),
                  VerticalSpace(TalebSizes.h16),
                ],
              ),
            ),
          );
        // } else {
        //   return const SizedBox.shrink();
        // }
      },
    );
  }

  void _selectServiceProvider(BuildContext context, NewsCubit newsCubit) async {
    final serviceProvider =
        await context.router.push<User>(const SearchSearviceProviderRoute());

    newsCubit.selectServiceProviderAndCity(serviceProvider: serviceProvider);
  }

  void _selectCity(BuildContext context, NewsCubit newsCubit) async {
    final city = await context.router.push<City>(const SearchCityRoute());

    newsCubit.selectServiceProviderAndCity(city: city);
  }

  void _clearFilterResult(BuildContext context, NewsCubit newsCubit) async {
    newsCubit.clearFilterResult();
  }
}
