import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/presentations/widgets/container_tag.dart';
import 'package:taleb/main.dart';
import 'package:taleb/routes/app_router.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    required this.opportunity,
    Key? key,
  }) : super(key: key);

  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(OpportunityDetailsRoute(
        opportunity: opportunity,
      )),
      child: TalebContainer(
        padding: EdgeInsets.all(TalebPadding.p12),
        margin: EdgeInsets.only(bottom: TalebPadding.p8),
        child: Row(
          children: [
            Hero(
              tag: opportunity.id,
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
                    children: [
                      ContainerTagWidget(
                        title: opportunity.opportunityCategory.name,
                      ),
                      ContainerTagWidget(
                        title: opportunity.city.name,
                      ),
                    ],
                  ),
                  VerticalSpace(TalebSizes.h8),
                  Text(
                    opportunity.title,
                    style: Theme.of(context).textTheme.labelSmall?.chathamsBlue,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
