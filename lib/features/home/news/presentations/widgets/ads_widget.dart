import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/taleb_image.dart';

class NewsAds extends StatelessWidget {
  const NewsAds({
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
         padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
          child: InkWell(
            onTap: null,
            child: TalebImageWidget(
              height: TalebSizes.h80,
              image: image,
            ),
          ),
        ),
        VerticalSpace(TalebSizes.h16),
        const TalebDivider2(),
        VerticalSpace(TalebSizes.h16),
      ],
    );
  }
}
