import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';

import '../news/presentations/searvice_provider_news/searvice_provider.dart';

class SearviceProviderImageAndName extends StatelessWidget {
  final double padding;
  final double? radius;
  final User? user;

  const SearviceProviderImageAndName({
    required this.padding,
    required this.user,
    Key? key,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushWidget(const SearviceProviderNewsPage()),
      child: Container(
        padding: EdgeInsets.only(
          right: padding,
          left: TalebPadding.p8,
          top: padding,
          bottom: padding,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff37b0cc),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: radius ?? 10,
              backgroundImage: NetworkImage(
                user!.image,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              user!.name,
              style: Theme.of(context).textTheme.titleSmall!.white,
            ),
          ],
        ),
      ),
    );
  }
}
