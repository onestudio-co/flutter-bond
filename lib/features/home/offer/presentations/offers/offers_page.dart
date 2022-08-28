import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/ad/presentations/cubit/ad_cubit.dart';
import 'package:taleb/features/home/widgets/filter_widget.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

import '../../offer_imports.dart';

class OffersPage extends StatefulWidget implements AutoRouteWrapper {
  const OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OffersCubit>(
          create: (BuildContext context) => sl<OffersCubit>()..loadOffers(),
        ),
        BlocProvider<AdCubit>(
          create: (BuildContext context) => sl<AdCubit>()..getAds(),
        ),
      ],
      child: this,
    );
  }
}

class _OffersPageState extends State<OffersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollControllerListener(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TalebAppBar(
        showBack: false,
        title: TalebStrings.bottomNavBarSooq,
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
                      hintText: TalebStrings.newsHomeTitleAppbar,
                      onChanged: context.read<OffersCubit>().searchOffer,
                    ),
                  ),
                  HorizontalSpace(TalebSizes.w8),
                  FilterWidget(
                    onTap: () {},
                  ),
                ],
              ),
            ),
            VerticalSpace(TalebSizes.h16),
            const TalebDivider2(),
            const ServiceProvidersSlider(),
            const OffersGridView(),
          ],
        ),
      ),
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
      context.read<OffersCubit>().loadOffers();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      _scrollControllerListener(context);
    });
    _scrollController.dispose();
    super.dispose();
  }
}
