import 'package:flutter/material.dart';

class FixitButton extends StatelessWidget {
  const FixitButton({
    Key? key,
    required this.onPress,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Function() onPress;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            icon,
            // icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
