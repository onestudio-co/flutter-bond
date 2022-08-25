import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';

class TitleOfferCard extends StatelessWidget {
  const TitleOfferCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge!.chathamsBlue,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
