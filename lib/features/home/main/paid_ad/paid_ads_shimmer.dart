import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_container.dart';

class PaidAdsShimmer extends StatelessWidget {
  const PaidAdsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
      child: Stack(
        children: [
          ShimmerContainer(height: TalebSizes.h257),
          SizedBox(
            height: TalebSizes.h257,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    height: TalebSizes.h8,
                    width: TalebSizes.w8,
                    margin: EdgeInsetsDirectional.only(
                        end: TalebSizes.w4, bottom: TalebSizes.h16),
                    decoration: const BoxDecoration(
                      color: TalebColors.paleAqua,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
