import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';

class SimilerShimmer extends StatelessWidget {
  const SimilerShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h240,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: TalebPadding.p32),
            child: SizedBox(
              width: TalebSizes.w265,
              height: TalebSizes.h240,
              child: Stack(
                children: [
                  TalebShimmer(
                    child: Container(
                      width: TalebSizes.w265,
                      height: TalebSizes.h198,
                      decoration: BoxDecoration(
                        color: TalebColors.yellowDark,
                        borderRadius:
                            BorderRadius.circular(TalebBorderRadius.r16),
                      ),
                    ),
                  ),
                  TalebShimmer(
                    highlightColor: TalebColors.ghostWhite,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: TalebSizes.h108,
                        width: TalebSizes.w232,
                        decoration: BoxDecoration(
                          color: TalebColors.ghostWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(TalebBorderRadius.r8),
                          ),
                        ),
                      ),
                    ),
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
