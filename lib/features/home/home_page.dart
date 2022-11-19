import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.home_page_title),
        actions: const [
          BondPopMenuButton(),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
