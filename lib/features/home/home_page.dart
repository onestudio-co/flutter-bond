import 'package:bond/core/app_localizations.dart';
import 'package:flutter/material.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.home_page_title),
        actions: [
          PopupMenuButton<Menu>(
              onSelected: (Menu item) {

              },
              icon: Icon(Icons.more_vert_rounded),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.itemOne,
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemFour,
                      child: Text('Item 4'),
                    ),
                  ]),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
