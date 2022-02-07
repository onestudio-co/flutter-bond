import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/core/widgets/pin_field_auto_fill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../debouncer.dart';

class FixitCodeTextFieldWidget extends StatefulWidget {
  final String label;
  final String? apiKey;
  final FixitTextType type;
  final IconData? icon;
  final String? svgIcon;
  final String? errorString;
  final String? couponString;

  final bool autoFocus;
  final int? maxLength;
  final double fontSize;
  final double svgPadding;
  final TextEditingController controller;
  final Function? onActiveTyping;
  final ValueChanged<String>? onChanged;
  final int multilineMaxLine;
  final String? hintText;
  final bool enabled;
  final bool isAssets;
  final double svgWidth;
  final double marginLeft;
  final double marginRight;
  final double marginLeftIcon;
  final Color? borderNormalColor;
  final FocusNode? focusNode;
  final Function? onTap;
  final Function? onTapCoupon;
  final Function? onTapClearCoupon;

  final Widget? action;
  const FixitCodeTextFieldWidget({
    Key? key,
    required this.label,
    this.icon,
    this.svgIcon,
    this.errorString,
    this.type = FixitTextType.normal,
    this.autoFocus = false,
    this.maxLength,
    this.apiKey,
    required this.controller,
    this.borderNormalColor,
    this.svgPadding = 0,
    this.fontSize = 17,
    this.onActiveTyping,
    this.onChanged,
    this.multilineMaxLine = 8,
    this.hintText,
    this.isAssets = true,
    this.enabled = true,
    this.svgWidth = 20,
    this.marginLeft = 20,
    this.marginRight = 20,
    this.marginLeftIcon = 30,
    this.focusNode,
    this.onTap,
    this.onTapCoupon,
    this.couponString,
    this.action,
    this.onTapClearCoupon,
  }) : super(key: key);

  @override
  _FixitCodeTextFieldWidgetState createState() =>
      _FixitCodeTextFieldWidgetState();
}

class _FixitCodeTextFieldWidgetState
    extends State<FixitCodeTextFieldWidget> {
  var active = false;
  bool _obscureText = true;
  double height = 0;
  bool sendButtonEnable = false;
  //dart flutter

  //todo remove validation when clear
  refreshSendButtonEnable(String txt) {
    setState(() {
      var code = widget.controller.text
          .replaceAll(' ', '')
          .trim(); //.replaceAll(RegExp(r"\s+"), "");
      sendButtonEnable = code.trim().isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      refreshSendButtonEnable(widget.controller.text);
    });
  }

  final _debouncer = Debouncer(milliseconds: 500);
  late String _code;

  @override
  Widget build(BuildContext context) {
    sendButtonEnable = widget.controller.text.trim().isNotEmpty;
    return FocusScope(
        child: Focus(
            onFocusChange: (focus) {
              if (focus == true) {
                widget.onActiveTyping?.call();
              }
              setState(() {
                active = focus;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: widget.marginRight, left: widget.marginLeft),
                  padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
                  child: Row(
                    children: [
                      widget.svgIcon != null
                          ? SizedBox(
                              width: 30,
                              height: 30,
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
                              ? const SizedBox(width: 0)
                              : Icon(
                                  widget.icon,
                                  color: widget.errorString == null
                                      ? Constant.violetColorDark
                                      : Constant.redColorRegular,
                                ),
                      SizedBox(width: widget.marginLeftIcon),
                      Expanded(
                        child: TextFieldPinAutoFill(
                          textController: widget.controller,
                          codeLength: 4,
                          currentCode: _code,
                          // focusNode: widget.focusNode != null
                          //     ? widget.focusNode
                          //     : null,
                          onCodeSubmitted: (value) {
                            widget.onChanged?.call(value);
                          },
                          onCodeChanged: (value) {
                            _code = value;
                            _debouncer.run(() {
                              WidgetsBinding.instance
                                  ?.addPostFrameCallback((_) {
                                widget.onChanged?.call(value);
                              });
                              //perform search here
                            });

                            //
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: widget.fontSize,
                            fontFamily: AppFontFamily.regular,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: widget.hintText,
                            labelText:
                                widget.hintText != null ? null : widget.label,
                            hintStyle: widget.hintText != null
                                ? const TextStyle(
                                    height: 0.7,
                                    color: Constant.navyColorRegular)
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
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Visibility(
                          visible: widget.type == FixitTextType.mobile,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
//                              width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 1.4,
                                  height: 25,
                                  color: Constant.navyColorRegular,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text("966+",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: AppFontFamily.regular,
                                    ))
                              ],
                            ),
                          )),
                      Visibility(
                        visible: widget.type == FixitTextType.coupon &&
                            widget.controller.text
                                .replaceAll(RegExp(r"\s+"), "")
                                .isNotEmpty,
                        child: InkWell(
                          onTap: () {
                            widget.onTapClearCoupon?.call();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                "assets/images/clear_coupon.svg",
                                width: 30,
                              )),
                        ),
                      ),
                      Visibility(
                        visible: widget.type == FixitTextType.coupon,
                        child: InkWell(
                          onTap: () {
                            if (sendButtonEnable) {
                              widget.onTapCoupon?.call();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 10, left: 10),
                            // height: 0,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(41)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x0f000000),
                                      offset: Offset(0, 8),
                                      blurRadius: 16,
                                      spreadRadius: 0)
                                ],
                                color: sendButtonEnable
                                    ? Constant.cyanColorRegular
                                    : Constant.greyColorRegular),
                            child: Text("فحص",
                                style: TextStyle(
                                  color: sendButtonEnable
                                      ? Colors.white
                                      : Constant.navyColorLight,
                                  fontFamily: AppFontFamily.regular,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.type == FixitTextType.password,
                        child: Container(
                            width: 100,
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
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
                            )),
                      ),
                      Visibility(
                        visible: widget.action != null,
                        child: Container(
                            width: 100,
                            alignment: Alignment.centerLeft,
                            child: widget.action),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: widget.marginRight,
                      left: widget.marginLeft,
                      top: 0),
                  height: 2,
                  color: widget.errorString == null
                      ? widget.borderNormalColor ?? Constant.borderNormalColor
                      : Constant.redColorRegular,
                ),
                if (widget.couponString != null)
                  Container(
                    margin: EdgeInsets.only(
                        right: widget.marginRight + 30 + widget.marginLeftIcon,
                        left: 15,
                        top: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Constant.greenColorRegular,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.couponString!,
                            style: const TextStyle(
                              color: Constant.greenColorRegular,
                              fontSize: 15,
                              fontFamily: AppFontFamily.regular,
                            )),
                      ],
                    ),
                  ),
                if (widget.errorString != null)
                  Container(
                    margin: EdgeInsets.only(
                        right: widget.marginRight + 30 + widget.marginLeftIcon,
                        left: 15,
                        top: 8),
                    child: Text(widget.errorString!,
                        style: const TextStyle(
                          color: Constant.redColorRegular,
                          fontSize: 12,
                          fontFamily: AppFontFamily.regular,
                        )),
                  ),
                const SizedBox(height: 1),
              ],
            )));
  }
}
