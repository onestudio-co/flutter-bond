import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'config/app.dart';
import 'core/cache/cache.dart';
import 'features/app/bloc/app_bloc.dart';

final sl = GetIt.instance;
App appBloc = App();

Future<void> init() async {
  sl.allowReassignment = true;

  for (var provider in providers) {
    await provider.register(sl);
  }

  Cache.decrement('quantity', 21);
  debugPrint('quantity: ${await Cache.get('quantity')}');
}
