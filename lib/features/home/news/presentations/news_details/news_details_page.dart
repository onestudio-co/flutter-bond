import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/widgets/slide_similers/main_widget_news.dart';

import 'cubit/similer_cubit.dart';
import 'widget/news_date_and_searvice_provider.dart';

class NewsDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  const NewsDetailsPage({
    required this.news,
    Key? key,
  }) : super(key: key);

  final News news;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SimilerCubit>(
      create: (BuildContext context) =>
          sl<SimilerCubit>()..similerNews(news.id),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.favorite),
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
                index: news.id,
                image: news.image,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(TalebSizes.h16),
                    DateAndSearviceProviderWidget(user: news.user),
                    VerticalSpace(TalebSizes.h12),
                    Text(
                      news.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.elephant,
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Padding(
                      padding: EdgeInsets.only(bottom: TalebPadding.p32),
                      child: Text(
                        news.content,
                        style:
                            Theme.of(context).textTheme.displayLarge!.elephant,
                      ),
                    ),
                    SimilarMainNewsWidget(news: news),
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
