import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
    locale = LocaleType.en,
    required DateTime currentTime,
    required DatePickerTheme theme,
  }) {
    return Future.value(DateTime.now().subtract(const Duration(days: 1024)));
  }
}
