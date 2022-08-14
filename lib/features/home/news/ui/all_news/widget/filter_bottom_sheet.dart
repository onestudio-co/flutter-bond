import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/widgets/search_city_bottom_sheet.dart';
import 'package:taleb/features/home/widgets/search_searvice_provider_bottom_sheet.dart';

import 'row_selected_filter_widget.dart';

class FilterNewsBottomSheet extends StatelessWidget {
  const FilterNewsBottomSheet({
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
                    onTap: () => _showSearviceProvidersBottomSheet(context),
                  ),
                  const TalebDivider(),
                  RowSelectedFilterWidget(
                    title: 'المدينة',
                    onTap: () => _showCityBottomSheet(context),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TalebButtonWidget(
              onPressed: () {},
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

  void _showCityBottomSheet(BuildContext context) {
    showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => const SearchCityBottomSheet(),
    );
  }
}
