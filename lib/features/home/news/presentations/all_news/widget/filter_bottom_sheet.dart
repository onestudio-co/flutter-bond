import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/routes/app_router.dart';

import 'row_selected_filter_widget.dart';

class FilterNewsPage extends StatelessWidget {
  const FilterNewsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h375,
      width: double.infinity,
      color: TalebColors.ghostWhite,
      child: Padding(
        padding: EdgeInsets.all(TalebPadding.p16),
        child: Column(
          children: <Widget>[
            Text('تصفية النتائج',
                style: Theme.of(context).textTheme.bodySmall?.darkJungleGreen),
            VerticalSpace(TalebSizes.h20),
            Align(
              alignment: Alignment.centerRight,
              child: Text('الرجاء أختيار معلومات التصفية',
                  style:
                      Theme.of(context).textTheme.labelMedium?.darkJungleGreen),
            ),
            VerticalSpace(TalebSizes.h8),
            TalebContainer(
              child: Column(
                children: <Widget>[
                  RowSelectedFilterWidget(
                    title: 'الناشر',
                    onTap: () async => await context.router
                        .push(const SearchSearviceProviderRoute()),
                  ),
                  const TalebDivider(),
                  RowSelectedFilterWidget(
                      title: 'المدينة',
                      onTap: () async {
                        await context.router.push(const SearchCityRoute());
                      }),
                ],
              ),
            ),
            const Spacer(),
            TalebButtonWidget(
              onPressed: () async =>
                  await context.router.pop<Search>(Search(1, 2)),
              title: 'حفظ',
            ),
            VerticalSpace(TalebSizes.h16),
          ],
        ),
      ),
    );
  }
}

class Search {
  final int serviceProviders;
  final int city;

  Search(this.serviceProviders, this.city);
}
