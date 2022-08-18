import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/news/presentations/searvice_provider_news/cubit/searvice_provider_news_cubit.dart';
import 'package:taleb/features/home/news/presentations/widgets/news_card.dart';
import 'package:taleb/main.dart';

class SearviceProviderNewsPage extends StatefulWidget
    implements AutoRouteWrapper {
  const SearviceProviderNewsPage({
    required this.searviceProviderId,
    Key? key,
  }) : super(key: key);

  final int searviceProviderId;

  @override
  State<SearviceProviderNewsPage> createState() =>
      _SearviceProviderNewsPageState();

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider<ServiceProviderNewsCubit>(
        create: (BuildContext context) => sl<ServiceProviderNewsCubit>()
          ..loadServiceProviderNews(serviceProviderId: searviceProviderId),
        child: this,
      );
}

class _SearviceProviderNewsPageState extends State<SearviceProviderNewsPage> {
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
    return GestureDetector(
      onTap: _scrollToTop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TalebColors.white,
        ),
        body: BlocConsumer<ServiceProviderNewsCubit, ServiceProviderNewsState>(
          listener: (BuildContext context, ServiceProviderNewsState state) {
            state is ServiceProviderNewsLoadFailed ? log(state.error) : null;
          },
          builder: (BuildContext context, ServiceProviderNewsState state) {
            if (state is ServiceProviderNewsEmpty) {
              return const Center(child: Text('لا يوجد بيانات ....'));
            } else if (state is ServiceProviderNewsLoadSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: TalebColors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VerticalSpace(TalebSizes.h8),
                          CircleAvatar(
                            radius: TalebSizes.h40,
                            backgroundColor: TalebColors.greyRegular,
                            child: CircleAvatar(
                              radius: TalebSizes.h38,
                              backgroundImage: NetworkImage(url),
                            ),
                          ),
                          VerticalSpace(TalebSizes.h8),
                          Text(
                            state.news.data[0].user.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.chathamsBlue,
                          ),
                          VerticalSpace(TalebSizes.h2),
                          Text(
                            state.news.data[0].city.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.coolGrey,
                          ),
                          VerticalSpace(TalebSizes.h20),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.news.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCardWidget(news: state.news.data[index]);
                      },
                    ),
                    if (state is ServiceProviderNewsLoadMoreState)
                      Column(
                        children: const [
                          SizedBox(height: 12),
                          TalebCircularProgressIndicator(),
                        ],
                      ),
                  ],
                ),
              );
            } else if (state is ServiceProviderNewsLoading) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 0,
                  top: 24.0,
                ),
                color: Colors.white,
                child: const Center(child: Text('جاري التحميل .........')),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
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
      final ServiceProviderNewsCubit cubit =
          context.read<ServiceProviderNewsCubit>();
      cubit.loadServiceProviderNews();
    }
  }
}
