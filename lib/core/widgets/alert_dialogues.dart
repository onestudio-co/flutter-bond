import 'package:bond/core/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/app/app_bloc.dart';

class ShowDialogues {
  Future<void> showLanguagesDialogue(
    BuildContext context,
  ) {
    final appBloc = context.read<AppBloc>();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Choose your favourite language!'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RadioListTile(
                  title: Text(context.localizations.english),
                  value: "en",
                  groupValue: appBloc.state.currentLocale.languageCode,
                  onChanged: (String? selectedLanguage) {
                    appBloc.add(const ChangeLocaleEvent(Locale("en")));
                  },
                ),
                RadioListTile(
                  title: Text(context.localizations.arabic),
                  value: "ar",
                  groupValue: appBloc.state.currentLocale.languageCode,
                  onChanged: (String? selectedLanguage) {
                    appBloc.add(const ChangeLocaleEvent(Locale("ar")));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
