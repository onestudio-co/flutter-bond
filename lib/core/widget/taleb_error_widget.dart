import 'package:flutter/material.dart';

import '../resources/import_resources.dart';

class TalebErrorWidget extends StatelessWidget {
  const TalebErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          VerticalSpace(TalebSizes.h108),
          Image.asset(TalebImages.emptySearchData),
          VerticalSpace(TalebSizes.h32),
          Text(
            TalebStrings.errorPageTitle,
            style: Theme.of(context).textTheme.headlineMedium?.elephant,
            textAlign: TextAlign.center,
          ),
          VerticalSpace(TalebSizes.h8),
          Text(
            TalebStrings.errorPageDescription,
            style: Theme.of(context).textTheme.labelLarge?.elephant,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
