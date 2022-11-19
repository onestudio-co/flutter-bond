import 'package:bond/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BadgeUnreadNotification extends StatelessWidget {
  const BadgeUnreadNotification({
    this.isRead = false,
    Key? key,
  }) : super(key: key);

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return !isRead
        ? Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
          )
        : const SizedBox.shrink();
  }
}
