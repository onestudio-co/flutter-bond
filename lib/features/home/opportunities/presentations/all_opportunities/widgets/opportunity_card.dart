import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_container.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/routes/app_router.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    required this.opportunity,
    this.cardWidth,
    this.imageHeight,
    Key? key,
  }) : super(key: key);

  final Opportunity opportunity;
  final double? cardWidth;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(OpportunityDetailsRoute(
        opportunity: opportunity,
      )),
      child: TalebContainer(
        width: cardWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: opportunity.id,
                    child: TalebImageWidget(
                      image: opportunity.image,
                      height: imageHeight ?? TalebSizes.h230,
                    ),
                  ),
                  VerticalSpace(TalebSizes.h8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            opportunity.opportunityCategory.name,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.elephant,
                          ),
                          Text(
                            ' | ',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.elephant,
                          ),
                          Text(
                            opportunity.city.name,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.elephant,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: TalebSizes.w133,
                        child: Text(
                          '2 أغسطس 2022| 12:34 مساءً',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.coolGrey,
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(TalebSizes.h8),
                  Text(
                    opportunity.title,
                    style: Theme.of(context).textTheme.headlineLarge?.elephant,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    opportunity.content,
                    style: Theme.of(context).textTheme.bodyLarge?.elephant,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            VerticalSpace(TalebSizes.h16),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h16),
          ],
        ),
      ),
    );
  }
}
