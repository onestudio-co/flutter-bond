import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:flutter/material.dart';

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
      color: Constant.violetColorExtraDark,
      child: const Center(
        child: SizedBox(height: 120, width: 120, child: FlutterLogo()),
      ),
    );
  }

  FutureOr _navigateToNextScreen() {
    context.router.push(const HomeRoute());
  }
}
