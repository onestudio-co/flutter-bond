import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';

import 'selected_item_listview.dart';

class SearchCityBottomSheet extends StatelessWidget {
  const SearchCityBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TalebColors.ghostWhite,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
          child: Column(
            children: [
              VerticalSpace(TalebSizes.h24),
              Text(
                'اختيار المدينة',
                style: Theme.of(context).textTheme.labelMedium?.elephant,
              ),
              VerticalSpace(TalebSizes.h24),
              SizedBox(
                width: double.infinity,
                height: TalebSizes.h53,
                child: const SearchWidget(
                  hintText: 'أكتب اسم المدينة',
                ),
              ),
              VerticalSpace(TalebSizes.h12),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (BuildContext context, int index) {
                    return const TalebDivider(
                      color: TalebColors.brightGray,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ItemListViewWidget(
                      name: 'وزارة الثقافة',
                      selectedIndex: 3,
                      index: index,
                    );
                  },
                ),
              ),
              TalebButtonWidget(
                onPressed: () {},
                title: 'حفظ',
              ),
              VerticalSpace(TalebSizes.h16),
            ],
          ),
        ),
      ),
    );
  }
}
