import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';

class SearchCityShimmer extends StatelessWidget {
  const SearchCityShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      padding: EdgeInsets.only(top: TalebPadding.p16),
      separatorBuilder: (context, index) {
        return Column(
          children: [
            VerticalSpace(TalebSizes.h20),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h20),
          ],
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ShimmerContainer(
          height: TalebSizes.h20,
          borderRadius: TalebBorderRadius.r16,
        );
      },
    );
  }
}
