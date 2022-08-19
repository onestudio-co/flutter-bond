import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/routes/app_router.dart';

class SearviceProviderImageAndName extends StatelessWidget {
  final double padding;
  final double? radius;
  final double? height;
  final User user;
  final TextStyle? textStyle;

  const SearviceProviderImageAndName({
    required this.padding,
    required this.user,
    Key? key,
    this.radius,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router
          .push(SearviceProviderNewsRoute(searviceProviderId: user.id)),
      child: Container(
        height: height ?? TalebSizes.h24,
        decoration: BoxDecoration(
          color: TalebColors.blueDark,
          borderRadius:
              BorderRadius.all(Radius.circular(TalebBorderRadius.r32)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: padding,
                top: padding,
                bottom: padding,
              ),
              child: CircleAvatar(
                radius: radius ?? TalebSizes.h10,
                backgroundImage: NetworkImage(
                  user.image,
                ),
              ),
            ),
            HorizontalSpace(TalebSizes.w4),
            Padding(
              padding: EdgeInsets.only(
                bottom: TalebPadding.p2,
              ),
              child: Text(
                user.name,
                style:
                    textStyle ?? Theme.of(context).textTheme.titleSmall!.white,
              ),
            ),
            HorizontalSpace(TalebSizes.w8),
          ],
        ),
      ),
    );
  }
}
