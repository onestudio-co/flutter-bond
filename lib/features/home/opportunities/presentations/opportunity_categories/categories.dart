import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class OpportunityCategories extends StatefulWidget {
  const OpportunityCategories({Key? key}) : super(key: key);
  @override
  State<OpportunityCategories> createState() => _OpportunityCategoriesState();
}

class _OpportunityCategoriesState extends State<OpportunityCategories> {
  List<String> categories = [
    'الكل',
    'أكاديمية',
    'تدريبية',
    'مجتمعية',
    'متنوعة',
    'منصة طالب'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebPadding.p8),
      child: SizedBox(
        height: TalebSizes.h44,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TalebPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              categories[index],
              style: selectedIndex == index
                  ? Theme.of(context).textTheme.bodyMedium?.chathamsBlue
                  : Theme.of(context).textTheme.bodyMedium?.coolGrey,
            ),
            Container(
              margin: EdgeInsets.only(top: TalebPadding.p8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TalebBorderRadius.r8),
                color: selectedIndex == index
                    ? TalebColors.blueRegular
                    : Colors.transparent,
              ),
              height: 2,
              width: TalebSizes.w40,
            )
          ],
        ),
      ),
    );
  }
}
