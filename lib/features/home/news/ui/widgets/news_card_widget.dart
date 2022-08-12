import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import 'additional_info_row.dart';
import 'news_image.dart';
import 'title_news.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TalebPadding.p12),
      margin: EdgeInsets.only(top: TalebPadding.p12),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
      ),
      child: Column(
        children: [
          const TalebImageNews(),
          VerticalSpace(TalebSizes.h8),
          const RowAdditionalInfo(),
          VerticalSpace(TalebSizes.h8),
          const TitleNews(),
        ],
      ),
    );
  }
}
