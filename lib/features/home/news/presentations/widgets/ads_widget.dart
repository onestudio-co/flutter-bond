import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/taleb_image.dart';

class NewsAds extends StatelessWidget {
  const NewsAds({
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebSizes.h12),
      child: InkWell(
        onTap: null,
        child: TalebImageWidget(
          height: TalebSizes.h80,
          image: image,
        ),
      ),
    );
  }
}
