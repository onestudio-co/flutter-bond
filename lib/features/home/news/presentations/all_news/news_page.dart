import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/news/presentations/widgets/ads_widget.dart';
import 'package:taleb/features/home/news/presentations/widgets/news_card.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

import 'cubit/news_cubit.dart';
import 'widget/filter_bottom_sheet.dart';

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
    return BlocProvider<NewsCubit>(
      create: (BuildContext context) => sl<NewsCubit>()..loadNews(),
      child: Scaffold(
        appBar: const HomeAppBar(
          title: 'الأخبار',
        ),
        body: GestureDetector(
          onTap: _scrollToTop,
          child: Padding(
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
                Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      if (index < list1.length) {
                        return list1[index];
                      }
                      return const SizedBox();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return list[index];
                    },
                  ),
                ),
              ],
            ),
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
      final NewsCubit cubit = context.read<NewsCubit>();
      cubit.loadNews();
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

List<NewsCardWidget> list = List<NewsCardWidget>.generate(
  100,
  (int index) => NewsCardWidget(
    index: index,
  ),
);

List<NewsAds> list1 = List<NewsAds>.generate(
  3,
  (int index) => const NewsAds(),
);
