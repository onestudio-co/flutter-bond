import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/news/presentations/ui/widgets/ads_widget.dart';
import 'package:taleb/features/home/news/presentations/ui/widgets/news_card.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

import 'widget/filter_bottom_sheet.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: 'الأخبار',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
        child: Column(
          children: <Widget>[
            HorizontalSpace(TalebSizes.w8),
            Row(
              children: <Widget>[
                const Expanded(
                    child: SearchWidget(
                  hintText: 'ابحث في الأخبار',
                )),
                HorizontalSpace(TalebSizes.w8),
                FilterWidget(
                  onTap: () => _showCountryBottomSheet(context),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: list.length,
                separatorBuilder: (BuildContext context, int index) {
                  if (index < list1.length) {
                    return list1[index];
                  }
                  return const SizedBox();
                },
                itemBuilder: (BuildContext context, int index) {
                  return list[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showCountryBottomSheet(BuildContext context) {
  showBarModalBottomSheet(
    // expand: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) => const FilterNewsBottomSheet(),
  );
}

List<NewsCardWidget> list = List<NewsCardWidget>.generate(
  100,
  (int index) => NewsCardWidget(
    index: index,
  ),
);

List<NewsAds> list1 = List<NewsAds>.generate(
  3,
  (int index) => const NewsAds(),
);
