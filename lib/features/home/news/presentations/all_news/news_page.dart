import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/ad/data/models/ad.dart';
import 'package:taleb/features/ad/presentations/cubit/ad_cubit.dart';
import 'package:taleb/features/home/news/presentations/widgets/ads_widget.dart';
import 'package:taleb/features/home/news/presentations/widgets/news_card.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';
import 'package:taleb/routes/app_router.dart';

import 'cubit/news_cubit.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      _scrollControllerListener(context);
    });
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (BuildContext context) => sl<NewsCubit>()..loadNews(),
        ),
        BlocProvider<AdCubit>(
          create: (BuildContext context) => sl<AdCubit>()..getAds(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        _scrollController.addListener(() {
          _scrollControllerListener(context);
        });
        return Scaffold(
          appBar: HomeAppBar(
            title: TalebStrings.newsHomeTitleAppbar,
          ),
          body: GestureDetector(
            onTap: _scrollToTop,
            child: Column(
              children: [
                VerticalSpace(TalebSizes.h16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SearchWidget(
                          hintText: 'ابحث في الأخبار',
                          onChanged: context.read<NewsCubit>().searchNews,
                        ),
                      ),
                      HorizontalSpace(TalebSizes.w8),
                      FilterWidget(
                        onTap: () async => context.router.push(
                          FilterNewsRoute(newsCubit: context.read<NewsCubit>()),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocConsumer<NewsCubit, NewsState>(
                    listener: (BuildContext context, NewsState state) {
                      state is NewsLoadFailed
                          ? log(state.error, name: 'news page')
                          : null;
                    },
                    builder: (BuildContext context, NewsState state) {
                      sl<AdCubit>().getAds();
                      if (state is NewsEmpty) {
                        return const Center(child: Text('لا يوجد بيانات ....'));
                      } else if (state is NewsLoadSuccess) {
                        final List news = state.news.data;
                        return Column(
                          children: <Widget>[
                            VerticalSpace(TalebSizes.h16),
                            const TalebDivider2(),
                            VerticalSpace(TalebSizes.h16),
                            Expanded(
                              child: ListView.separated(
                                controller: _scrollController,
                                itemCount: news.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
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
                        );
                      } else if (state is NewsLoading) {
                        return const Center(
                            child: TalebCircularProgressIndicator());
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  void _scrollControllerListener(BuildContext context) {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta) {
      context.read<NewsCubit>().loadNews();
    }
  }
}
