import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/categories.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/cubit/opportunity_category_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/widgets/list_of_opportunities.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';
import 'package:taleb/routes/app_router.dart';

class OpportunitiesPage extends StatelessWidget {
  const OpportunitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpportunityCategoryCubit>(
          create: (BuildContext context) =>
              sl<OpportunityCategoryCubit>()..allCategories(),
        ),
        BlocProvider<OpportunityCubit>(
          create: (BuildContext context) =>
              sl<OpportunityCubit>()..loadOppertunities(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        return BlocListener<OpportunityCubit, OpportunityState>(
          listener: (BuildContext context, OpportunityState state) {
            state is OpportunityLoadFailed
                ? log(state.error, name: 'all opportunities page')
                : null;
          },
          child: Scaffold(
            appBar: TalebAppBar(
              title: TalebStrings.opportunitiesPageAppbarTitle,
              showBack: false,
            ),
            body: Column(
              children: <Widget>[
                const OpportunityCategories(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SearchWidget(
                          hintText: TalebStrings.opportunitiesPageHintTextField,
                          onChanged: context
                              .read<OpportunityCubit>()
                              .searchOpportnities,
                        ),
                      ),
                      HorizontalSpace(TalebSizes.w8),
                      FilterWidget(
                        onTap: () async => _onTapFilter(
                            context, context.read<OpportunityCubit>()),
                      ),
                    ],
                  ),
                ),
                VerticalSpace(TalebSizes.h16),
                const Expanded(child: ListOfOpportunities()),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _onTapFilter(BuildContext context, OpportunityCubit cubit) async {
    final city = await context.router.push<City>(const SearchCityRoute());
    if (city != null) {
      cubit.loadOppertunitiesForSpecificCity(cityId: city.id);
    }
  }
}
