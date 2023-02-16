import 'package:bond/app/default_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FirebaseServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final packageInfo = await PackageInfo.fromPlatform();
    it.registerSingleton(packageInfo);

    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    it.registerSingleton(firebaseApp);

    // TODO: extract this to new file
    final defaultParameters = <String, dynamic>{
      'appCurrentVersion':
          '{"ios":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"},"android":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"}}'
    };

    it.registerLazySingleton(
      () => FirebaseRemoteConfig.instance
        ..setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(minutes: 1),
            minimumFetchInterval: const Duration(minutes: 5),
          ),
        )
        ..setDefaults(defaultParameters),
    );
  }
}
