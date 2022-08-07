import 'package:flutter/material.dart';

import 'widgets/taleb_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(
        title: 'الأخبار',
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
