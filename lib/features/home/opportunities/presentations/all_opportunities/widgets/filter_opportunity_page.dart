import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/widgets/row_selected_filter_widget.dart';
import 'package:taleb/routes/app_router.dart';

// ignore: must_be_immutable
class FilterOpportunityPage extends StatelessWidget
    implements AutoRouteWrapper {
  FilterOpportunityPage({
    required this.opportunityCubit,
    Key? key,
  }) : super(key: key);

  final OpportunityCubit opportunityCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OpportunityCubit>.value(
      value: opportunityCubit,
      child: this,
    );
  }

  int? cityId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunityCubit, OpportunityState>(
      builder: (BuildContext context, OpportunityState state) {
        return Container(
          height: TalebSizes.h375,
          width: double.infinity,
          color: TalebColors.ghostWhite,
          child: Padding(
            padding: EdgeInsets.all(TalebPadding.p16),
            child: Column(
              children: <Widget>[
                Text('تصفية النتائج',
                    style:
                        Theme.of(context).textTheme.bodySmall?.darkJungleGreen),
                VerticalSpace(TalebSizes.h20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('الرجاء أختيار معلومات التصفية',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.darkJungleGreen),
                ),
                VerticalSpace(TalebSizes.h8),
                TalebContainer(
                  child: RowSelectedFilterWidget(
                      title: 'المدينة',
                      onTap: () async {
                        cityId = await context.router
                            .push<int>(const SearchCityRoute());
                      }),
                ),
                const Spacer(),
                TalebButtonWidget(
                  onPressed: () {
                    context
                        .read<OpportunityCubit>()
                        .loadOppertunitiesForSpecificCity(cityId: cityId);
                    cityId = null;
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
