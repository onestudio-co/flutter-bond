import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/categories.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/cubit/opportunity_category_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/widgets/list_of_opportunities.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

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
      child: Scaffold(
        appBar: const HomeAppBar(
          title: 'الفرص',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
          child: Column(
            children: <Widget>[
              const OpportunityCategories(),
              VerticalSpace(TalebSizes.h10),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: SearchWidget(
                      hintText: 'ابحث في الفرص',
                    ),
                  ),
                  HorizontalSpace(TalebSizes.w8),
                  FilterWidget(
                    // onTap: () => _showCityBottomSheet(context),
                    onTap: () => {},
                  ),
                ],
              ),
              const Expanded(child: ListOfOpportunities()),
            ],
          ),
        ),
      ),
    );
  }

  // void _showCityBottomSheet(BuildContext context) {
  //   showBarModalBottomSheet(
  //     expand: true,
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext context) => const SearchCityBottomSheet(),
  //   );
  // }
}
