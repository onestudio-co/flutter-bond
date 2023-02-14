import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_icons.dart';
import 'package:bond/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoftUpdatePage extends StatelessWidget {
  const SoftUpdatePage({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Stack(children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () => context.router.pop(),
                icon: SvgPicture.asset(AppIcons.close, color: Colors.grey),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.forceUpdate,
                  width: 104,
                  height: 104,
                ),
                const SizedBox(height: 32),
                const Text(
                    // context.localizations.update_app ?? '',
                    'حان وقت التحديث'),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 87.0),
                  child: Text(
                    message ?? '',
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                AppButton(
                  // title: context.localizations.update_app_now ?? '',
                  title: 'تحديث الآن',
                  onPressed: onUpdate,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void onUpdate() {
    // //TODO:: CHANGE appStoreId
    // OpenStore.instance.open(
    //   appStoreId: '',
    //   androidAppBundleId: 'ps.app.rasel',
    // );
  }
}
