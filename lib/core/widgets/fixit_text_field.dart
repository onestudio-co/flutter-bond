import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

enum FixitTextType {
  normal,
  email,
  mobile,
  password,
  number,
  multiline,
  coupon
}

class FixitTextFieldWidget extends StatefulWidget {
  final String label;
  final String? apiKey;
  final FixitTextType type;
  final Widget? action;
  final IconData? icon;
  final String? svgIcon;
  final String? errorString;
  final bool autoFocus;
  final int? maxLength;
  final double fontSize;
  final double svgPadding;
  final TextEditingController controller;
  final Function onActiveTyping;
  final ValueChanged<String> onChanged;
  final int multilineMaxLine;
  final String? hintText;
  final bool enabled;
  final bool isAssets;
  final double svgWidth;
  final double marginLeft;
  final double marginRight;
  final double marginRightContainer;
  final double marginRightSvg;

  const FixitTextFieldWidget(
      {Key? key,
      required this.label,
      this.icon,
      this.action,
      this.svgIcon,
      this.errorString,
      this.type = FixitTextType.normal,
      this.autoFocus = false,
      this.maxLength,
      this.apiKey,
      required this.controller,
      this.svgPadding = 0,
      this.fontSize = 17,
      required this.onActiveTyping,
      required this.onChanged,
      this.multilineMaxLine = 8,
      this.hintText,
      this.isAssets = true,
      this.enabled = true,
      this.svgWidth = 20,
      this.marginLeft = 20,
      this.marginRight = 20,
      this.marginRightContainer = 8,
      this.marginRightSvg = 0})
      : super(key: key);

  @override
  _FixitTextFieldWidgetState createState() => _FixitTextFieldWidgetState();
}

class _FixitTextFieldWidgetState extends State<FixitTextFieldWidget> {
  var active = false;
  bool _obscureText = true;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          if (focus == true) {
            widget.onActiveTyping();
          }
          setState(() {
            active = focus;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: widget.type == FixitTextType.multiline ? null : 70,
              margin: const EdgeInsets.only(right: 2, left: 2),
              padding: EdgeInsets.only(
                  top: 10, right: widget.marginRightContainer, left: 0),
              child: TextField(
                enabled: widget.enabled,
                onChanged: (vv) {
                  widget.onChanged(vv);
                },
                maxLines: widget.type == FixitTextType.multiline
                    ? widget.multilineMaxLine
                    : 1,
                minLines: widget.type == FixitTextType.multiline ? 1 : 1,
                controller: widget.controller,
                maxLength: widget.maxLength,
                autofocus: widget.autoFocus,
                keyboardType: widget.type == FixitTextType.multiline
                    ? TextInputType.multiline
                    : widget.type == FixitTextType.number
                        ? TextInputType.number
                        : widget.type == FixitTextType.mobile
                            ? TextInputType.number
                            : TextInputType.text,
                textInputAction: widget.type == FixitTextType.multiline
                    ? null
                    : TextInputAction.done,
                cursorColor: Constant.primaryColor,
                cursorWidth: 2,
                cursorRadius: const Radius.circular(0.5),
                obscureText:
                    (widget.type == FixitTextType.password ? true : false) &&
                        (_obscureText == true),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widget.fontSize,
                  fontFamily: AppFontFamily.regular,
                ),
                decoration: InputDecoration(
                  suffixIcon: widget.type == FixitTextType.normal
                      ? null
                      : widget.type == FixitTextType.multiline
                          ? Container(
                              width: 8,
                            )
                          : Container(
                              width: 100,
                              padding: EdgeInsets.only(left: widget.marginLeft),
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: <Widget>[
                                  widget.type == FixitTextType.password
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black87,
                                          ),
                                        )
                                      : widget.type == FixitTextType.mobile
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              margin:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
//                              width: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    width: 1.4,
                                                    height: 25,
                                                    color: Constant
                                                        .navyColorRegular,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Text("966+",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            AppFontFamily
                                                                .regular,
                                                      ))
                                                ],
                                              ),
                                            )
                                          : const Text(""),
                                ],
                              ),
                            ),
                  prefixIcon: widget.svgIcon != null
                      ? Container(
                          width: 30,
                          margin: EdgeInsets.only(
                              left: 30,
                              right: widget.marginRightSvg > 0
                                  ? widget.marginRightSvg
                                  : widget.type == FixitTextType.multiline
                                      ? 0
                                      : widget.type == FixitTextType.normal
                                          ? 20
                                          : 10),
                          padding: EdgeInsets.all(widget.svgPadding),
                          child: Row(
                            children: [
                              widget.isAssets
                                  ? SvgPicture.asset(
                                      widget.svgIcon!,
                                      color: widget.errorString == null
                                          ? Constant.violetColorDark
                                          : Constant.redColorRegular,
                                      fit: BoxFit.contain,
                                    )
                                  : SvgPicture.network(
                                      widget.svgIcon!,
                                      width: widget.svgWidth,
                                      color: widget.errorString == null
                                          ? Constant.violetColorDark
                                          : Constant.redColorRegular,
                                      fit: BoxFit.contain,
                                    ),
                            ],
                          ))
                      : widget.icon == null
                          ? null
                          : Container(
                              margin:
                                  const EdgeInsets.only(left: 30, right: 10),
                              child: Icon(
                                widget.icon,
                                color: widget.errorString == null
                                    ? Constant.violetColorDark
                                    : Constant.redColorRegular,
                                size: 16,
                              ),
                            ),
                  contentPadding: widget.type == FixitTextType.normal
                      ? const EdgeInsets.only(left: 10)
                      : widget.hintText == null
                          ? const EdgeInsets.only(top: 5)
                          : const EdgeInsets.only(top: 5),
                  hintText: widget.hintText,
                  labelText: widget.hintText != null ? null : widget.label,
                  hintStyle: widget.hintText != null
                      ? const TextStyle(
                          height: 0.7, color: Constant.navyColorRegular)
                      : null,
                  labelStyle: TextStyle(
                      height: 0.7,
                      color: widget.hintText != null
                          ? Colors.transparent
                          : active == true
                              ? Constant.navyColorExtraDark
                              : Constant.navyColorRegular),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: widget.marginRight, left: widget.marginLeft),
              height: 2,
              color: widget.errorString == null
                  ? Constant.borderNormalColor
                  : Constant.redColorRegular,
            ),
            if (widget.errorString != null)
              Container(
                margin: EdgeInsets.only(
                    right: widget.marginRight + 30 + 25, left: 15, top: 10),
                child: Text(widget.errorString!,
                    style: const TextStyle(
                      color: Constant.redColorRegular,
                      fontSize: 12,
                      fontFamily: AppFontFamily.regular,
                    )),
              )
          ],
        ),
      ),
    );
  }
}
