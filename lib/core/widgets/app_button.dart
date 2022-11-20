import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: loading
          ? const CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            )
          : Text(title),
    );
  }
}
