import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_container.dart';

class LastNewsShimmer extends StatelessWidget {
  const LastNewsShimmer({
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
                        height: TalebSizes.h24,
                        width: TalebSizes.w86,
                      ),
                      ShimmerContainer(
                        height: TalebSizes.h15,
                        width: TalebSizes.w86,
                      ),
                    ],
                  ),
                  VerticalSpace(TalebSizes.h8),
                  ShimmerContainer(
                    height: TalebSizes.h15,
                  ),
                  VerticalSpace(TalebSizes.h12),
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
