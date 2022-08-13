import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/main.dart';

import 'selected_item_listview.dart';

class SearchSearviceProviderBottomSheet extends StatelessWidget {
  const SearchSearviceProviderBottomSheet({Key? key}) : super(key: key);

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
                'اختيار الناشر',
                style: Theme.of(context).textTheme.labelMedium?.elephant,
              ),
              VerticalSpace(TalebSizes.h24),
              SizedBox(
                width: double.infinity,
                height: TalebSizes.h53,
                child: const SearchWidget(
                  hintText: 'أكتب اسم الناشر',
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
                      logo: url,
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
