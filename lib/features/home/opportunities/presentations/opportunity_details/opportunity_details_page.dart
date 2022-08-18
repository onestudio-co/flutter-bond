import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/news/presentations/news_details/widget/news_date_and_searvice_provider.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/widgets/slide_similers/main_widget_news.dart';

class OpportunityDetailsPage extends StatelessWidget {
  const OpportunityDetailsPage({
    required this.opportunity,
    Key? key,
  }) : super(key: key);

  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.favorites),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: TalebSizes.h12),
          child: Column(
            children: [
              TalebSliderImagesWidget(
                index: opportunity.id,
                image: opportunity.image,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  children: [
                    VerticalSpace(TalebSizes.h16),
                    const DateAndSearviceProviderWidget(),
                    VerticalSpace(TalebSizes.h12),
                    Text(
                      opportunity.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.elephant,
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Padding(
                      padding: EdgeInsets.only(bottom: TalebPadding.p32),
                      child: Text(
                        opportunity.title,
                        style:
                            Theme.of(context).textTheme.displayLarge!.elephant,
                      ),
                    ),
                    const SimilarMainNewsWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
