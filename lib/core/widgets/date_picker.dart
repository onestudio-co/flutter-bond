import 'dart:async';

import 'package:flutter/material.dart';

typedef DateChangedCallback = Function(DateTime time);
typedef StringAtIndexCallBack = String Function(int index);

class FixitDatePicker {
  static Future<DateTime> showDatePicker(
    BuildContext context, {
    bool showTitleActions = true,
    required DateTime minTime,
    required DateTime maxTime,
    required DateChangedCallback onChanged,
    required DateChangedCallback onConfirm,
    required DateTime currentTime,
  }) {
    return Future.value(DateTime.now().subtract(const Duration(days: 1024)));
  }
}
