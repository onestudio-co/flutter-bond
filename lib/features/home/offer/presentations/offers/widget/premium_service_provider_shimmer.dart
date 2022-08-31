import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_avatar.dart';
import 'package:taleb/core/widget/shimmer_container.dart';

class PremiumServiceProviderShimmer extends StatelessWidget {
  const PremiumServiceProviderShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: TalebPadding.p16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: TalebPadding.p32),
                  child: SizedBox(
                    width: TalebSizes.w90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShimmerAvatar(radius: TalebSizes.h60),
                        VerticalSpace(TalebSizes.h8),
                        ShimmerContainer(height: TalebSizes.h10),
                        VerticalSpace(TalebSizes.h8),
                        ShimmerContainer(height: TalebSizes.h10),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          VerticalSpace(TalebSizes.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerContainer(
                height: TalebSizes.h8,
                width: TalebSizes.h8,
              ),
              HorizontalSpace(TalebSizes.w4),
              ShimmerContainer(
                height: TalebSizes.h8,
                width: TalebSizes.h8,
              ),
              HorizontalSpace(TalebSizes.w4),
              ShimmerContainer(
                height: TalebSizes.h8,
                width: TalebSizes.h8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
