import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/features/home/news/ui/widgets/news_image.dart';
import 'package:taleb/main.dart';

import 'container_tag.dart';

class ListOfOpportunities extends StatelessWidget {
  const ListOfOpportunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebPadding.p12),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => TalebContainer(
          padding: EdgeInsets.all(TalebPadding.p12),
          margin: EdgeInsets.only(bottom: TalebPadding.p8),
          child: Row(
            children: [
              Hero(
                tag: index,
                child: TalebImageWidget(
                  image: url,
                  width: TalebSizes.w145,
                  height: TalebSizes.h108,
                ),
              ),
              HorizontalSpace(TalebSizes.w12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ContainerTagWidget(
                          title: 'فرص أكاديمية',
                        ),
                        ContainerTagWidget(
                          title: 'الطفيلة',
                        ),
                      ],
                    ),
                    VerticalSpace(TalebSizes.h8),
                    Text(
                      'لقاء ارشادي و توجيهي لطلبة توجيهي 2005',
                      style:
                          Theme.of(context).textTheme.labelSmall?.chathamsBlue,
                    ),
                    VerticalSpace(TalebSizes.h4),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '2 أغسطس 2022| 12:34 مساءً',
                        style:
                            Theme.of(context).textTheme.displaySmall?.coolGrey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
