import 'package:bond/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bond_core/bond_core.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.onShare,
    Key? key,
  }) : super(key: key);

  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () => _onShare(context),
      icon: SvgPicture.asset(
        AppIcons.share,
        color: context.colorScheme.primary,
      ),
    );
  }

  void _onShare(BuildContext context) {
    onShare();
  }
}
