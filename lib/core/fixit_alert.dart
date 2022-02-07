import 'package:flutter/material.dart';

class FixitAlert {
  static void showNotificationBottom(BuildContext context,
      {required String title, required bool inLastBottom}) {
    final SnackBar snackBar = SnackBar(
      content: Text(title),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
