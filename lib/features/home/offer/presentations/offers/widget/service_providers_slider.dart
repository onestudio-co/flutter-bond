import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/main.dart';
import 'package:taleb/routes/app_router.dart';

class ServiceProvidersSlider extends StatelessWidget {
  const ServiceProvidersSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h140,
      padding: EdgeInsets.all(TalebPadding.p16),
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => context.router.push(ServiceProviderOffersTabBarRoute(
                user: User(id: 22, name: 'mohamed', image: url))),
            child: Container(
              width: TalebSizes.w100,
              margin: EdgeInsets.only(left: TalebPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TalebAvatarImage(
                    width: TalebSizes.w60,
                    height: TalebSizes.h60,
                    urlImage: url,
                  ),
                  Text(
                    'جامعة الزيتونة الأردنية',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge?.elephant,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
