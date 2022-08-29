import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/resources/taleb_string.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';
import 'package:taleb/features/home/main/last_news/cubit/last_news_cubit.dart';
import 'package:taleb/features/home/main/widgets/header_slider.dart';
import 'package:taleb/features/home/news/presentations/widgets/news_card.dart';
import 'package:taleb/routes/app_router.dart';

class LastNewsSlider extends StatelessWidget {
  const LastNewsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastNewsCubit, LastNewsState>(
      builder: (context, state) {
        if (state is LastNewsLoadedSuccess) {
          return Column(
            children: [
              HeaderSlider(
                title: TalebStrings.homeSliderLastNews,
                onTapSeeMore: () {},
              ),
              VerticalSpace(TalebSizes.h12),
              SizedBox(
                height: TalebSizes.h312,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    final news = state.news[index];
                    return NewsCardWidget(
                      news: news,
                      heightImage: TalebSizes.h192,
                      widthCard: TalebSizes.h282,
                      padding: EdgeInsets.symmetric(
                          horizontal: TalebPadding.defaultPadding),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is LastNewsLoading) {
          return TalebShimmer(
            child: Container(
              color: Colors.amber,
              height: 200,
              width: 200,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
