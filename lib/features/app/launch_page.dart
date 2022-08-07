import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/routes/app_router.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), _navigateToNextScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TalebColors.blueRegular,
      child: Center(
        child: SizedBox(
            height: TalebSizes.h200,
            width: TalebSizes.w200,
            child: SvgPicture.asset(TalebIcons.splashLogo)),
      ),
    );
  }

  FutureOr _navigateToNextScreen() {
    context.router.push(const HomeRoute());
  }
}
