import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import 'news/widgets/news_card_widget.dart';
import 'widgets/filter_widget.dart';
import 'widgets/search_widget.dart';
import 'widgets/taleb_app_bar.dart';

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
          children: [
            HorizontalSpace(TalebSizes.w8),
            Row(
              children: [
                const SearchWidget(),
                HorizontalSpace(TalebSizes.w8),
                const FilterWidget(),
              ],
            ),
            Expanded(
              child: ListView(
                children: list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var list = List.generate(
  100,
  (index) => const NewsCardWidget(),
);
