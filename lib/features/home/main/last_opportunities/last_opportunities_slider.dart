import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';
import 'package:taleb/features/home/main/last_opportunities/cubit/last_opportunities_cubit.dart';
import 'package:taleb/features/home/main/widgets/header_slider.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/widgets/opportunity_card.dart';

class LastOpportunitiesSlider extends StatelessWidget {
  const LastOpportunitiesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastOpportunitiesCubit, LastOpportunitiesState>(
      builder: (context, state) {
        if (state is LastOpportunitiesLoadedSuccess) {
          return Column(
            children: [
              HeaderSlider(
                title: TalebStrings.homeSliderLastOpportunities,
                onTapSeeMore: () => _onTapSeeMore(context),
              ),
              VerticalSpace(TalebSizes.h12),
              SizedBox(
                height: TalebSizes.h405,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.opportunities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final opportunities = state.opportunities[index];
                    return OpportunityCard(
                      opportunity: opportunities,
                      imageHeight: TalebSizes.h192,
                      cardWidth: TalebSizes.h282,
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is LastOpportunitiesLoading) {
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

  void _onTapSeeMore(BuildContext context) =>
      context.router.pushNamed('home/opportunities', onFailure: ((failure) {
        logger.i(failure);
      }));
}
