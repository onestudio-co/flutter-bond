import 'dart:developer';

import 'package:auto_route/auto_route.dart';

extension Helper on StackRouter {
  Future<void> off(PageRouteInfo route) async {
    try {
      popUntilRoot();
      await replaceAll([route]);
    } catch (error) {
      log('Error in off $error');
    }
  }
}
