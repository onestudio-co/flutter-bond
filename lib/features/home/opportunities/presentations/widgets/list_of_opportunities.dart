import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/core/widget/empty_data_widget.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/taleb_error_widget.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/widgets/opportunity_card.dart';
import 'package:taleb/features/home/opportunities/presentations/widgets/opportunities_listing_shimmer.dart';

class ListOfOpportunities extends StatelessWidget {
  const ListOfOpportunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunityCubit, OpportunityState>(
      builder: (BuildContext context, OpportunityState state) {
        if (state is OpportunityLoadSuccess) {
          return Column(
            children: [
              const TalebDivider2(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: TalebPadding.p12),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.oppertunities.data.length,
                    itemBuilder: (BuildContext context, int index) =>
                        OpportunityCard(
                            opportunity: state.oppertunities.data[index]),
                  ),
                ),
              ),
            ],
          );
        } else if (state is OpportunityLoading) {
          return const OpportunitiesListingShimmer();
        } else if (state is OpportunityEmpty) {
          return const EmptyDataWidget();
        } else {
          return const TalebErrorWidget();
        }
      },
    );
  }
}
