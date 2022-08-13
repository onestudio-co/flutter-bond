import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleb/core/resources/import_resources.dart';

class RowSelectedFilterWidget extends StatelessWidget {
  const RowSelectedFilterWidget({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TalebPadding.p24,
          vertical: TalebPadding.p16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.custome2,
            ),
            SvgPicture.asset(TalebIcons.favorites),
          ],
        ),
      ),
    );
  }
}
