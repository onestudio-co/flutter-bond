import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_avatar.dart';
import 'package:taleb/core/widget/shimmer_container.dart';

class PartnersShimmer extends StatelessWidget {
  const PartnersShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: TalebPadding.p16),
      height: TalebSizes.h120,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: TalebPadding.p32),
            child: SizedBox(
              width: TalebSizes.w90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerAvatar(radius: TalebSizes.h80),
                  VerticalSpace(TalebSizes.h12),
                  ShimmerContainer(height: TalebSizes.h10),
                  VerticalSpace(TalebSizes.h8),
                  ShimmerContainer(height: TalebSizes.h10),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
