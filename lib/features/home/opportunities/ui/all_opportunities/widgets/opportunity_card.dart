import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/opportunities/ui/opportunity_details/opportunity_details_page.dart';
import 'package:taleb/features/home/opportunities/widgets/container_tag.dart';
import 'package:taleb/main.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushWidget(OpportunityDetailsPage(
        index: index,
      )),
      child: TalebContainer(
        padding: EdgeInsets.all(TalebPadding.p12),
        margin: EdgeInsets.only(bottom: TalebPadding.p8),
        child: Row(
          children: [
            Hero(
              tag: index,
              child: TalebImageWidget(
                image: url,
                width: TalebSizes.w145,
                height: TalebSizes.h108,
              ),
            ),
            HorizontalSpace(TalebSizes.w12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ContainerTagWidget(
                        title: 'فرص أكاديمية',
                      ),
                      ContainerTagWidget(
                        title: 'الطفيلة',
                      ),
                    ],
                  ),
                  VerticalSpace(TalebSizes.h8),
                  Text(
                    'لقاء ارشادي و توجيهي لطلبة توجيهي 2005',
                    style: Theme.of(context).textTheme.labelSmall?.chathamsBlue,
                  ),
                  VerticalSpace(TalebSizes.h4),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '2 أغسطس 2022| 12:34 مساءً',
                      style: Theme.of(context).textTheme.displaySmall?.coolGrey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
