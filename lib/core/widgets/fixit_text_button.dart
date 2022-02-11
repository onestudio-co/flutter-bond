import 'package:fixit/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../assets.dart';
import 'date_picker.dart';

class FixitTextButton extends StatefulWidget {
  final String label;
  final Widget? action;
  final IconData? icon;
  final String? svgIcon;
  final String? errorString;
  final bool autoFocus;
  final double svgPadding;
  final TextEditingController controller;
  final Function? onActiveTyping;
  final String? initialValue;
  final Function(String)? onSubmitAction;

  const FixitTextButton({
    Key? key,
    required this.label,
    this.icon,
    this.action,
    this.svgIcon,
    this.errorString,
    this.autoFocus = false,
    this.svgPadding = 10,
    required this.controller,
    this.onActiveTyping,
    this.initialValue,
    this.onSubmitAction,
  }) : super(key: key);

  @override
  _FixitTextButtonState createState() => _FixitTextButtonState();
}

class _FixitTextButtonState extends State<FixitTextButton> {
  var active = false;
  var dateCurrent = DateTime.now().subtract(const Duration(days: 360 * 35));

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      dateCurrent = DateFormat('yyyy-MM-dd').parse(widget.initialValue!);
    } else {
      widget.controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onActiveTyping != null) {
          widget.onActiveTyping?.call();
        }
        if (widget.label != Strings.dobStartedLabel) {
          showDatePicker();
        }
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: 12,
                  top: 16,
                ),
                child: TextField(
                  enabled: false,
                  controller: widget.controller,
                  textInputAction: TextInputAction.done,
                  cursorColor: Constant.primaryColor,
                  cursorWidth: 2,
                  cursorRadius: const Radius.circular(0.5),
                  style: const TextStyle(
                    color: Constant.navyColorExtraDark,
                    fontSize: 17,
                    fontFamily: AppFontFamily.regular,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: widget.svgIcon != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 16),
                              padding: EdgeInsets.all(widget.svgPadding),
                              child: SvgPicture.asset(
                                widget.svgIcon!,
                                width: 20,
                                height: 20,
                                color: widget.errorString == null
                                    ? Constant.violetColorDark
                                    : Constant.redColorRegular,
                                fit: BoxFit.contain,
                              ),
                            )
                          : widget.icon == null
                              ? null
                              : Container(
                                  margin: const EdgeInsets.only(
                                      left: 50, right: 10),
                                  child: Icon(
                                    widget.icon,
                                    color: widget.errorString == null
                                        ? Constant.violetColorDark
                                        : Constant.redColorRegular,
                                  ),
                                ),
                      contentPadding: EdgeInsets.zero,
                      labelText: widget.label,
                      labelStyle: const TextStyle(
                          height: 1, color: Constant.navyColorLight),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      )),
                ),
              ),
              if (widget.action != null)
                Positioned(
                  child: widget.action!,
                  bottom: 15,
                  left: 10,
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            height: 1,
            color: widget.errorString == null
                ? Constant.borderNormalColor
                : Constant.redColorRegular,
          ),
          if (widget.errorString != null)
            Container(
              margin: const EdgeInsets.only(right: 80, left: 10, top: 10),
              child: Text(widget.errorString!,
                  style: const TextStyle(
                    color: Constant.redColorRegular,
                    fontSize: 12,
                    fontFamily: AppFontFamily.regular,
                  )),
            )
        ],
      ),
    );
  }

  void showDatePicker() {
    FixitDatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now().subtract(const Duration(days: 360 * 100)),
        maxTime: DateTime.now(),
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        dateCurrent = date;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(date);
        if (widget.onSubmitAction != null) {
          widget.onSubmitAction?.call(widget.controller.text);
        }
      });
      widget.controller.text = '';
      // widget.controller.text = DateFormat('yyyy-MM-dd').format(dateCurrent);
    }, currentTime: dateCurrent);
  }
}
