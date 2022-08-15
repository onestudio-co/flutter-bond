import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

import '../ui/all_opportunities/widgets/opportunity_card.dart';

class ListOfOpportunities extends StatelessWidget {
  const ListOfOpportunities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebPadding.p12),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) =>
            OpportunityCard(index: index),
      ),
    );
  }
}
