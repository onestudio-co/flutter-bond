import 'dart:ui';

import 'package:bond_cache/bond_cache.dart';
import 'package:bond_core/bond_core.dart';
import 'package:bond_form/validator_localizations.dart';
import 'package:get_it/get_it.dart';

class FormsServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    //TODO: How to force this to reload when language changes?
    final local = Locale(Cache.get<String>('language', defaultValue: 'en'));
    it.registerSingletonAsync(
      () async => ValidatorLocalizations.load(local),
    );
  }
}
