import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/shimmer_avatar.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';
import 'package:taleb/features/home/offer/presentations/offers/cubit/premium_service_provider/premium_service_provider_cubit.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/premium_service_provider_shimmer.dart';
import 'package:taleb/routes/app_router.dart';

class ServiceProvidersSlider extends StatelessWidget {
  const ServiceProvidersSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h140,
      padding: EdgeInsets.all(TalebPadding.p16),
      child:
          BlocBuilder<PremiumServiceProviderCubit, PremiumServiceProviderState>(
        builder: (context, state) {
          if (state is PremiumServiceProviderLoadedSuccess) {
            return ListView.builder(
              itemCount: state.users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => context.router.push(
                    ServiceProviderOffersTabBarRoute(
                      user: state.users[index],
                    ),
                  ),
                  child: Container(
                    width: TalebSizes.w100,
                    margin: EdgeInsets.only(left: TalebPadding.p8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TalebAvatarImage(
                          width: TalebSizes.w60,
                          height: TalebSizes.h60,
                          urlImage: state.users[index].image,
                        ),
                        Text(
                          state.users[index].name,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.elephant,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PremiumServiceProviderLoading) {
            return const PremiumServiceProviderShimmer();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
