import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_container.dart';

class LastOpportunitiesShimmer extends StatelessWidget {
  const LastOpportunitiesShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: TalebPadding.p16),
      height: TalebSizes.h312,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: TalebPadding.p32),
            child: SizedBox(
              width: TalebSizes.w281,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    height: TalebSizes.h192,
                    borderRadius: TalebBorderRadius.r16,
                  ),
                  VerticalSpace(TalebSizes.h12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(
                        height: TalebSizes.h16,
                        width: TalebSizes.w100,
                      ),
                      ShimmerContainer(
                        height: TalebSizes.h15,
                        width: TalebSizes.w133,
                      ),
                    ],
                  ),
                  VerticalSpace(TalebSizes.h8),
                  ShimmerContainer(
                    height: TalebSizes.h24,
                  ),
                  VerticalSpace(TalebSizes.h8),
                  ShimmerContainer(
                    height: TalebSizes.h15,
                  ),
                  
                  VerticalSpace(TalebSizes.h8),
                  ShimmerContainer(
                    height: TalebSizes.h15,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
