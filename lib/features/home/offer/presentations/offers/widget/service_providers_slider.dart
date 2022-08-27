import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';
import 'package:taleb/main.dart';

class ServiceProvidersSlider extends StatelessWidget {
  const ServiceProvidersSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h200,
      padding: EdgeInsets.all(TalebPadding.p16),
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: TalebSizes.w90,
            padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TalebAvatarImage(
                  width: TalebSizes.w60,
                  height: TalebSizes.h60,
                  urlImage: url,
                ),
                Text(
                  'جامعة الزيتونة الأردنية',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge?.elephant,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
