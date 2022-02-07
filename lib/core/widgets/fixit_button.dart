// import 'package:fixit/constants.dart';
// import 'package:fixit/core/utils.dart';
// import 'package:flutter/material.dart';
//
// class FixitButton extends StatefulWidget {
//   final String label;
//   final Color background;
//   final Color labelColor;
//   final bool loading;
//   final bool enable;
//   final bool closekeyboard;
//   final Function onTab;
//   final Function onLongPress;
//   final BorderSide border;
//
//   const FixitButton(
//       {Key key,
//       this.label,
//       this.background,
//       this.labelColor,
//       this.onTab,
//       this.onLongPress,
//       this.loading = false,
//       this.enable = true,
//       this.closekeyboard = true,
//       this.border})
//       : super(key: key);
//
//   @override
//   _FixitButtonState createState() => _FixitButtonState();
// }
//
// class _FixitButtonState extends State<FixitButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child:
//
//       MaterialButton(
//         autofocus: false,
//         disabledColor: widget.enable == false
//             ? Constant.greyColorRegular
//             : widget.background,
//         height: getHeight(55),
//         onLongPress: widget.loading == true
//             ? null
//             : () {
//                 if (widget.closekeyboard == true) {
//                   FocusScope.of(context).unfocus();
//                 }
//                 if (widget.enable == true) widget.onLongPress();
//               },
//         onPressed: widget.loading == true
//             ? null
//             : () {
//                 if (widget.closekeyboard == true) {
//                   FocusScope.of(context).unfocus();
//                 }
//                 if (widget.enable == true) widget.onTab();
//               },
//         color: widget.enable == false
//             ? Constant.greyColorRegular
//             : widget.background,
//         elevation: 0,
//         highlightElevation: 0,
//         shape: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             borderSide: widget.border != null
//                 ? widget.border
//                 : BorderSide(
//                     width: 0,
//                     color: widget.enable == false
//                         ? Constant.greyColorRegular
//                         : widget.background,
//                   )),
//         padding: EdgeInsets.all(13),
//         child: widget.loading == true
//             ? Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Theme(
//                     data: Theme.of(context).copyWith(accentColor: Colors.white),
//                     child: SizedBox(
//                         height: 30.0,
//                         width: 30.0,
//                         child: CircularProgressIndicator()),
//                   ),
//                 ],
//               )
//             : Text(
//                 widget.label,
//                 style: TextStyle(
//                   fontSize: Constant.fontSize
//                   color: widget.enable == false
//                       ? Constant.navyColorLight
//                       : widget.labelColor,
//                   fontFamily: AppFontFamily.regular,
//                 ),
//               ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../constants.dart';

class FixitButton extends StatefulWidget {
  final String label;
  final String? secondLabel;
  final Color background;
  final Color labelColor;
  final Color? secondLabelColor;
  final bool loading;
  final bool enable;
  final bool closekeyboard;
  final Function onTab;
  final Function? onLongPress;
  final BorderSide? border;
  final String? fontFamily;
  final double? fontSize;
  final BorderRadius? borderRadius;

  const FixitButton(
      {Key? key,
      required this.label,
      this.secondLabel,
      required this.background,
      required this.labelColor,
      this.secondLabelColor,
      required this.onTab,
      this.onLongPress,
      this.loading = false,
      this.enable = true,
      this.closekeyboard = true,
      this.fontFamily,
      this.fontSize,
      this.border,
      this.borderRadius})
      : super(key: key);

  @override
  _FixitButtonState createState() => _FixitButtonState();
}

class _FixitButtonState extends State<FixitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        autofocus: false,
        disabledColor: widget.enable == false
            ? Constant.greyColorRegular
            : widget.background,
        height: 50,
        onLongPress: widget.loading == true
            ? null
            : () {
                if (widget.closekeyboard == true) {
                  FocusScope.of(context).unfocus();
                }
                if (widget.enable == true) widget.onLongPress?.call();
              },
        onPressed: widget.loading == true
            ? null
            : () {
                if (widget.closekeyboard == true) {
                  FocusScope.of(context).unfocus();
                }
                if (widget.enable == true) widget.onTab();
              },
        color: widget.enable == false
            ? Constant.greyColorRegular
            : widget.background,
        elevation: 0,
        highlightElevation: 0,
        shape: OutlineInputBorder(
            borderRadius: widget.borderRadius ??
                const BorderRadius.all(Radius.circular(10)),
            borderSide: widget.border != null
                ? widget.border!
                : BorderSide(
                    width: 0,
                    color: widget.enable == false
                        ? Constant.greyColorRegular
                        : widget.background,
                  )),
        padding: const EdgeInsets.all(13),
        child: widget.loading == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Theme(
                    // ignore: deprecated_member_use
                    data: Theme.of(context).copyWith(accentColor: Colors.white),
                    child: const SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: CircularProgressIndicator()),
                  ),
                ],
              )
            : (widget.secondLabel != null)
                ? Column(
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: 13,
                          color: widget.enable == false
                              ? Constant.navyColorLight
                              : widget.labelColor,
                          fontFamily: AppFontFamily.regular,
                        ),
                      ),
                      Text(
                        widget.secondLabel!,
                        style: TextStyle(
                          fontSize: 17,
                          color: widget.enable == false
                              ? Constant.navyColorLight
                              : widget.secondLabelColor,
                          fontFamily: AppFontFamily.regular,
                        ),
                      ),
                    ],
                  )
                : Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: widget.fontSize ?? 17,
                      color: widget.enable == false
                          ? Constant.navyColorLight
                          : widget.labelColor,
                      fontFamily: widget.fontFamily ?? AppFontFamily.regular,
                    ),
                  ),
      ),
    );
  }
}
