import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/presentations/news_details/cubit/similer_cubit.dart';
import 'package:taleb/features/home/widgets/slide_similers/stack_widget_news.dart';

import 'title_widget.dart';

class SimilarMainNewsWidget extends StatelessWidget {
  const SimilarMainNewsWidget({
    this.news,
    Key? key,
  }) : super(key: key);

  final News? news;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerCubit, SimilerState>(
      builder: (BuildContext context, SimilerState state) {
        if (state is SimilerLoadedSuccess) {
          return Container(
            height: TalebSizes.h370,
            width: MediaQuery.of(context).size.width,
            color: TalebColors.white,
            padding: EdgeInsets.symmetric(
              vertical: TalebPadding.p32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SimilerLabelWidget(
                  title: 'أخبار مماثلة',
                ),
                VerticalSpace(TalebSizes.h16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.news.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return SimilerStackNewsWidget(news: state.news[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is SimilerLoadFailure) {
          return const Center(child: Text('حدث خطأ ما .........'));
        } else {
          return const TalebCircularProgressIndicator();
        }
      },
    );
  }
}