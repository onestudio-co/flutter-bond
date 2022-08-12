import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  const HomeAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size(double.infinity, TalebSizes.h45);
}
