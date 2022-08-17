import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';

class TalebCircularProgressIndicator extends StatelessWidget {
  const TalebCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: TalebColors.yellowRegular,
      strokeWidth: 4,
    );
  }
}
