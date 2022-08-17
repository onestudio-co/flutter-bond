import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RouterHelpers {
  static Route<T> modalSheetBuilder<T>(
      BuildContext context, Widget child, CustomPage<T> page) {
    return ModalBottomSheetRoute(
      settings: page,
      builder: (BuildContext context) => child,
      expanded: false,
      containerBuilder: (_, __, Widget child) => BarBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
