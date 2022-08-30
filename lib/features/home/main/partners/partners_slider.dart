import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';
import 'package:taleb/features/home/main/partners/partners_shimmer.dart';
import 'package:taleb/features/home/main/widgets/header_slider.dart';
import 'package:taleb/features/service_provider/presentations/partner_cubit/partner_cubit.dart';

class PartnerSlider extends StatelessWidget {
  const PartnerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerCubit, PartnerState>(
      builder: (context, state) {
        if (state is PartnerLoadedSuccess) {
          return Column(
            children: [
              HeaderSlider(
                title: TalebStrings.homeSliderPartners,
                onTapSeeMore: () {},
                isShowMore: false,
              ),
              VerticalSpace(TalebSizes.h16),
              SizedBox(
                height: TalebSizes.h140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.serviceProviders.length,
                  padding: EdgeInsets.symmetric(horizontal: TalebSizes.w8),
                  itemBuilder: (BuildContext context, int index) {
                    final partnert = state.serviceProviders[index];
                    return SizedBox(
                      width: TalebSizes.w100,
                      child: Column(
                        children: [
                          TalebAvatarImage(
                            width: TalebSizes.w80,
                            height: TalebSizes.h80,
                            urlImage: partnert.image,
                          ),
                          VerticalSpace(TalebSizes.h4),
                          Text(
                            partnert.name,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.elephant,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is PartnerLoading) {
          return Column(
            children: [
              HeaderSlider(
                title: TalebStrings.homeSliderPartners,
                onTapSeeMore: () {},
                isShowMore: false,
              ),
              VerticalSpace(TalebSizes.h16),
              const PartnersShimmer(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  // void _onTapSeeMore(BuildContext context) =>
  //     context.router.pushNamed('home/opportunities', onFailure: ((failure) {
  //       logger.i(failure);
  //     }));
}
