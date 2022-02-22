import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  void Function()? onPressed;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed!();
        },
        child: child);
  }
}