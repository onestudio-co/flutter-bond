import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/widgets/search_searvice_provider_bottom_sheet.dart';
import 'package:taleb/routes/app_router.dart';

import 'row_selected_filter_widget.dart';

class FilterNewsBottomSheet extends StatelessWidget {
  const FilterNewsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? i = 0;
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
                    onTap: () => _showSearviceProvidersBottomSheet(context),
                  ),
                  const TalebDivider(),
                  RowSelectedFilterWidget(
                      title: 'المدينة',
                      onTap: () async {
                        i = await context.router.push<int>(const SearchCityRoute());
                      }),
                ],
              ),
            ),
            const Spacer(),
            TalebButtonWidget(
              onPressed: () => log('$i'),
              title: 'حفظ',
            ),
            VerticalSpace(TalebSizes.h16),
          ],
        ),
      ),
    );
  }

  void _showSearviceProvidersBottomSheet(BuildContext context) {
    showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) =>
          const SearchSearviceProviderBottomSheet(),
    );
  }
}
