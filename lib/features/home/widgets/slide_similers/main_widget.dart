import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/news/data/models/news.dart';

import 'stack_widget.dart';
import 'title_widget.dart';

class SimilarMainWidget extends StatelessWidget {
  const SimilarMainWidget({
     this.news,
    Key? key,
  }) : super(key: key);

  final News? news;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h370,
      width: MediaQuery.of(context).size.width,
      color: TalebColors.custome1,
      padding: EdgeInsets.symmetric(
        horizontal: TalebPadding.p16,
        vertical: TalebPadding.p32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimilerTitleWidget(),
          VerticalSpace(TalebSizes.h16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SimilerStackWidget(news: news);
              },
            ),
          ),
        ],
      ),
    );
  }
}
