import 'package:flutter/material.dart';

class FixitAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function() onTapBackButton;
  const FixitAppBar({
    Key? key,
    required this.title,
    required this.onTapBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        onPressed: onTapBackButton,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
