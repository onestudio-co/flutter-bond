import 'dart:developer';

import 'package:bond_cache/bond_cache.dart';
import 'package:bond_core/bond_core.dart';
import 'package:bond_form/validator_localizations.dart';
import 'package:get_it/get_it.dart';

class FormsServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    // TODO - local must be a getter constructor in the ValidatorLocalizations class
    log('Cache.get('', defaultValue: '') = ${Cache.get<String>('language', defaultValue: 'en')}');
    it.registerSingleton(
      ValidatorLocalizations(Cache.get('language', defaultValue: 'en')),
    );
  }
}
