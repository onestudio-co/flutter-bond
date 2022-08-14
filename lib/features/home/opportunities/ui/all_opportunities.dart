import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

import '../widgets/categories.dart';
import '../widgets/list_of_opportunities.dart';

class OpportunitiesPage extends StatelessWidget {
  const OpportunitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onTap: () => {},
                ),
              ],
            ),
            const Expanded(child: ListOfOpportunities()),
          ],
        ),
      ),
    );
  }
}
