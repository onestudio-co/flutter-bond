import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/app_widgets.dart';
import 'package:bond/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class UpdateAppPage extends StatefulWidget {
  final String? message;
  static var shown = false;

  const UpdateAppPage({Key? key, this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdateAppPageState();
}

class _UpdateAppPageState extends State<UpdateAppPage> {
  @override
  void initState() {
    UpdateAppPage.shown = true;
    super.initState();
  }

  @override
  void dispose() {
    UpdateAppPage.shown = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                AppIcons.forceUpdate,
              ),
              const SizedBox(
                height:16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    // context.localizations.update_app??'',
                    'حان وقت التحديث',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 87.0),
                    child: Text(
                      widget.message.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppButton(
                      // title: context.localizations.update_app_now??'',
                      title: 'تحديث الآن',
                      onPressed: _onUpdate,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUpdate() {
    //TODO::CHANGE appStoreId
    // OpenStore.instance.open(
    //   appStoreId: '',
    //   androidAppBundleId: 'ps.app.rasel',
    // );
  }
}
