import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double value;

  const HorizontalSpace(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double value;

  const VerticalSpace(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}