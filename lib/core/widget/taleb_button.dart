import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class TalebButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final bool enable;
  final BorderRadius? borderRadius;
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool loading;
  final TextStyle? titleTextStyle;
  final EdgeInsets? padding;
  final Size? loadingProgressSize;
  final double? progressStrokeWidth;
  final Widget? child;
  final Color? borderColor;

  const TalebButtonWidget({
    required this.onPressed,
    Key? key,
    this.enable = true,
    this.borderRadius,
    this.title,
    this.titleColor,
    this.width,
    this.height,
    this.backgroundColor = TalebColors.blueDark,
    this.loading = false,
    this.titleTextStyle,
    this.padding,
    this.child,
    this.borderColor,
    this.loadingProgressSize,
    this.progressStrokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding ?? EdgeInsets.symmetric(vertical: TalebPadding.p8),
      onPressed: loading
          ? () {}
          : enable
              ? onPressed
              : null,
      color: enable ? backgroundColor : TalebColors.ghostWhite,
      disabledColor: enable ? backgroundColor : TalebColors.ghostWhite,
      elevation: 0,
      highlightElevation: 0,
      minWidth: width ?? double.infinity,
      height: height ?? TalebSizes.h53,
      highlightColor: Colors.transparent,
      shape: OutlineInputBorder(
        borderRadius:
            borderRadius ?? BorderRadius.circular(TalebBorderRadius.r12),
        borderSide: BorderSide(
          width: borderColor == null ? 0 : TalebSizes.w2,
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: Text(
        title ?? '',
        style: titleColor == null
            ? Theme.of(context).textTheme.bodySmall?.white
            : Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: titleColor),
      ),
    );
  }
}
