import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/cubit/service_provider_offer_cubit.dart';

import '../widgets/offers_card.dart';

class ServiceProviderOfferPage extends StatefulWidget
    implements AutoRouteWrapper {
  const ServiceProviderOfferPage({
    required this.serviceProviderId,
    Key? key,
  }) : super(key: key);

  final int serviceProviderId;

  @override
  State<ServiceProviderOfferPage> createState() =>
      _ServiceProviderOfferPageState();

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider<ServiceProviderOfferCubit>(
        create: (BuildContext context) => sl<ServiceProviderOfferCubit>()
          ..loadServiceProviderOffer(serviceProviderId: serviceProviderId),
        child: this,
      );
}

class _ServiceProviderOfferPageState extends State<ServiceProviderOfferPage> {
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
        body: BlocConsumer<ServiceProviderOfferCubit, ServiceProviderOfferState>(
          listener: (BuildContext context, ServiceProviderOfferState state) {
            state is ServiceProviderOfferLoadFailed ? log(state.error) : null;
          },
          builder: (BuildContext context, ServiceProviderOfferState state) {
            if (state is ServiceProviderOfferEmpty) {
              return const Center(child: Text('لا يوجد بيانات ....'));
            } else if (state is ServiceProviderOfferLoadSuccess) {
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
                              backgroundImage:
                                  NetworkImage(state.offer.data[0].user.image),
                            ),
                          ),
                          VerticalSpace(TalebSizes.h8),
                          Text(
                            state.offer.data[0].user.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.chathamsBlue,
                          ),
                          VerticalSpace(TalebSizes.h2),
                          Text(
                            state.offer.data[0].city.name,
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
                      itemCount: state.offer.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OfferCardWidget(offer: state.offer.data[index]);
                      },
                    ),
                    if (state is ServiceProviderOfferLoadMoreState)
                      Column(
                        children: const [
                          SizedBox(height: 12),
                          TalebCircularProgressIndicator(),
                        ],
                      ),
                  ],
                ),
              );
            } else if (state is ServiceProviderOfferLoading) {
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
      final ServiceProviderOfferCubit cubit =
          context.read<ServiceProviderOfferCubit>();
      cubit.loadServiceProviderOffer();
    }
  }
}
