import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/widgets/opportunity_card.dart';

class ListOfOpportunities extends StatelessWidget {
  const ListOfOpportunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunityCubit, OpportunityState>(
      builder: (BuildContext context, OpportunityState state) {
        if (state is OpportunityLoadSuccess) {
          return Padding(
            padding: EdgeInsets.only(top: TalebPadding.p12),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.oppertunities.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  OpportunityCard(opportunity: state.oppertunities.data[index]),
            ),
          );
        } else if (state is OpportunityLoading) {
          return const Center(child: TalebCircularProgressIndicator());
        } else {
          return const Center(
            child: Text('حدث خطا ما ...'),
          );
        }
      },
    );
  }
}
