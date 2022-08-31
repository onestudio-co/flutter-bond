import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';

class OpportunitiesListingShimmer extends StatelessWidget {
  const OpportunitiesListingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(TalebSizes.h16),
        const TalebDivider2(),
        VerticalSpace(TalebSizes.h16),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: TalebSizes.h16),
                  child: const TalebDivider2(),
                );
              },
              itemCount: 3,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      height: TalebSizes.h192,
                      borderRadius: TalebBorderRadius.r16,
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Row(
                      children: [
                        ShimmerContainer(
                          height: TalebSizes.h15,
                          width: TalebSizes.w86,
                        ),
                        const Spacer(),
                        ShimmerContainer(
                          height: TalebSizes.h15,
                          width: TalebSizes.w86,
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
                    VerticalSpace(TalebSizes.h12),
                    ShimmerContainer(
                      height: TalebSizes.h15,
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
