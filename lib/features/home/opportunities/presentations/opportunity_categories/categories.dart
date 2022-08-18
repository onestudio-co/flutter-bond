import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_categories/cubit/opportunity_category_cubit.dart';

class OpportunityCategories extends StatefulWidget {
  const OpportunityCategories({Key? key}) : super(key: key);
  @override
  State<OpportunityCategories> createState() => _OpportunityCategoriesState();
}

class _OpportunityCategoriesState extends State<OpportunityCategories> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunityCategoryCubit, OpportunityCategoryState>(
      builder: (BuildContext context, OpportunityCategoryState state) {
        if (state is OpportunityCategoryLoadedSuccess) {
          return Padding(
            padding: EdgeInsets.only(top: TalebPadding.p8),
            child: SizedBox(
              height: TalebSizes.h44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildCategory(index, state.categories[index]),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: TalebSizes.h44,
          );
        }
      },
    );
  }

  Widget buildCategory(int index, OpportunityCategory opportunityCategory) {
    return GestureDetector(
      onTap: () {
        context.read<OpportunityCubit>().loadOppertunities(
            categoryId: opportunityCategory.id, emitLoading: true);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TalebPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              opportunityCategory.name,
              style: _selectedIndex == index
                  ? Theme.of(context).textTheme.bodyMedium?.chathamsBlue
                  : Theme.of(context).textTheme.bodyMedium?.coolGrey,
            ),
            Container(
              margin: EdgeInsets.only(top: TalebPadding.p8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TalebBorderRadius.r8),
                color: _selectedIndex == index
                    ? TalebColors.blueRegular
                    : Colors.transparent,
              ),
              height: 2,
              width: TalebSizes.w40,
            )
          ],
        ),
      ),
    );
  }
}
