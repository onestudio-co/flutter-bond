import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';

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
                    onTap: () {},
                  ),
                  const TalebDivider(),
                  RowSelectedFilterWidget(
                    title: 'المدينة',
                    onTap: () {},
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
}
