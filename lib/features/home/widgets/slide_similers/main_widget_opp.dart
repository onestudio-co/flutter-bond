import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_details/cubit/similer_opportunity_cubit.dart';

import 'stack_widget_opp.dart';
import 'title_widget.dart';

class SimilarMainOpportunitiesWidget extends StatelessWidget {
  const SimilarMainOpportunitiesWidget({
    this.opportunity,
    Key? key,
  }) : super(key: key);

  final Opportunity? opportunity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerOpportunityCubit, SimilerOpportunityState>(
      builder: (BuildContext context, SimilerOpportunityState state) {
        if (state is SimilerOpportunityLoadedSuccess) {
          return Container(
            height: TalebSizes.h370,
            width: MediaQuery.of(context).size.width,
            color: TalebColors.custome1,
            padding: EdgeInsets.symmetric(
              horizontal: TalebPadding.p16,
              vertical: TalebPadding.p32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SimilerLabelWidget(),
                VerticalSpace(TalebSizes.h16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.opportunities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return SimilerStackOpportunityWidget(
                          opportunity: state.opportunities[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is SimilerOpportunityLoadFailure) {
          return const Center(child: Text('حدث خطأ ما .........'));
        } else {
          return const TalebCircularProgressIndicator();
        }
      },
    );
  }
}
