import 'package:fixit/core/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void showLogout(BuildContext context, Function select) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(Strings.logoutFromThisDevice,
                style: const TextStyle(
                  fontSize: 17,
                  color: Constant.redColorRegular,
                  fontFamily: AppFontFamily.regular,
                )),
            onPressed: () {
              Navigator.pop(context);
              select(false);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(Strings.logoutFromAllDevices,
                style: const TextStyle(
                  fontSize: 17,
                  color: Constant.redColorRegular,
                  fontFamily: AppFontFamily.regular,
                )),
            onPressed: () {
              Navigator.pop(context);
              select(true);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            Strings.cancel,
            style: const TextStyle(
              fontSize: 17,
              color: Constant.navyColorRegular,
              fontFamily: AppFontFamily.regular,
            ),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}

late BuildContext dialogContext;

showLoading(BuildContext _context) {
  showDialog(
    context: _context,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (BuildContext context) {
      dialogContext = context;

      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 70),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Image.asset(
            "assets/images/loader_new.gif",
            width: 80,
            height: 80,
          ),
        ),
      );
    },
  );
}

hideLoading(BuildContext _context) {
  Navigator.pop(dialogContext);
}
