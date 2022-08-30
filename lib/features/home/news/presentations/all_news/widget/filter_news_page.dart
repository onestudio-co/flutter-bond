import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/news/presentations/all_news/cubit/news_cubit.dart';
import 'package:taleb/routes/app_router.dart';

import '../../../../widgets/row_selected_filter_widget.dart';

// ignore: must_be_immutable
class FilterNewsPage extends StatelessWidget implements AutoRouteWrapper {
  FilterNewsPage({
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

  int? cityId;
  int? userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (BuildContext context, NewsState state) {
        return Container(
          height: TalebSizes.h375,
          width: double.infinity,
          color: TalebColors.ghostWhite,
          child: Padding(
            padding: EdgeInsets.all(TalebPadding.p16),
            child: Column(
              children: <Widget>[
                Text(TalebStrings.filterNewsTitle,
                    style:
                        Theme.of(context).textTheme.bodySmall?.darkJungleGreen),
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
                        title: TalebStrings.filterNewsPublisher,
                        onTap: () async {
                          userId = await context.router
                              .push<int>(const SearchSearviceProviderRoute());
                        },
                      ),
                      const TalebDivider(),
                      RowSelectedFilterWidget(
                          title: TalebStrings.filterNewsCity,
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
                    context.read<NewsCubit>().loadNews(
                        cityId: cityId,
                        searviceProviderId: userId,
                        emitLoading: true);
                    cityId = null;
                    userId = null;
                    context.router.pop();
                  },
                  title: TalebStrings.saveButton,
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
