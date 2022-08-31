import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_avatar.dart';
import 'package:taleb/core/widget/shimmer_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';

class SearchServiceProviderShimmer extends StatelessWidget {
  const SearchServiceProviderShimmer({
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
        return Row(
          children: [
            ShimmerAvatar(radius: TalebSizes.h32),
            HorizontalSpace(TalebSizes.w8),
            ShimmerContainer(
              height: TalebSizes.h20,
              width: TalebSizes.w145,
              borderRadius: TalebBorderRadius.r16,
            ),
          ],
        );
      },
    );
  }
}
