import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/ad/data/models/ad.dart';
import 'package:taleb/features/ad/presentations/cubit/ad_cubit.dart';
import 'package:taleb/features/home/news/presentations/widgets/ads_widget.dart';
import 'package:taleb/features/home/news/presentations/widgets/news_card.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';
import 'package:taleb/main.dart';

import 'cubit/news_cubit.dart';
import 'widget/filter_bottom_sheet.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();
  late NewsCubit newsCubit;

  @override
  void initState() {
    super.initState();
    newsCubit = sl<NewsCubit>();
    _scrollController.addListener(_scrollControllerListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollControllerListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (BuildContext context) => newsCubit..loadNews(),
        ),
        BlocProvider<AdCubit>(
          create: (BuildContext context) => sl<AdCubit>()..getAds(),
        ),
      ],
      child: Scaffold(
        appBar: const HomeAppBar(
          title: 'الأخبار',
        ),
        body: GestureDetector(
          onTap: _scrollToTop,
          child: BlocConsumer<NewsCubit, NewsState>(
            listener: (BuildContext context, NewsState state) {
              state is NewsLoadFailed ? log(state.error) : null;
            },
            builder: (BuildContext context, NewsState state) {
              sl<AdCubit>().getAds();
              if (state is NewsEmpty) {
                return const Center(child: Text('لا يوجد بيانات ....'));
              } else if (state is NewsLoadSuccess) {
                final List news = state.news.data;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                  child: Column(
                    children: <Widget>[
                      HorizontalSpace(TalebSizes.w8),
                      Row(
                        children: <Widget>[
                          const Expanded(
                              child: SearchWidget(
                            hintText: 'ابحث في الأخبار',
                          )),
                          HorizontalSpace(TalebSizes.w8),
                          FilterWidget(
                            onTap: () => _showCountryBottomSheet(context),
                          ),
                        ],
                      ),
                      VerticalSpace(TalebSizes.h8),
                      Expanded(
                        child: ListView.separated(
                          controller: _scrollController,
                          itemCount: news.length,
                          separatorBuilder: (BuildContext context, int index) {
                            List<Ad> ads = sl<AdCubit>().ads;
                            if (index < ads.length) {
                              return NewsAds(image: ads[index].image);
                            }
                            return const SizedBox();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return NewsCardWidget(news: news[index]);
                          },
                        ),
                      ),
                      if (state is NewsLoadMoreState)
                        Column(
                          children: const [
                            SizedBox(height: 12),
                            TalebCircularProgressIndicator(),
                          ],
                        )
                    ],
                  ),
                );
              } else if (state is NewsLoading) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 0,
                    top: 24.0,
                  ),
                  color: Colors.white,
                  child: const Center(child: Text('Loading .........')),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  void _scrollControllerListener() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta) {
      // final NewsCubit cubit = context.read<NewsCubit>();
      newsCubit.loadNews();
    }
  }
}

void _showCountryBottomSheet(BuildContext context) {
  showBarModalBottomSheet(
    // expand: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) => const FilterNewsBottomSheet(),
  );
}

List list = List.generate(
  100,
  (int index) => Container(),
);

List<NewsAds> list1 = List<NewsAds>.generate(
  3,
  (int index) => NewsAds(
    image: url,
  ),
);
