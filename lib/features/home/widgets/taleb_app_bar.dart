import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class TalebAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onPressBack;
  final bool showBack;
  final PreferredSizeWidget? bottom;

  const TalebAppBar({
    Key? key,
    this.title,
    this.actions,
    this.onPressBack,
    this.showBack = true,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      leading: Visibility(
        visible: showBack,
        child: IconButton(
          onPressed: onPressBack ?? () => context.router.pop(),
          // icon: SvgPicture.asset(TalebIcons.downArrow),
          icon: const Icon(Icons.arrow_right_alt_sharp),
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size(double.infinity, TalebSizes.h45);
}
