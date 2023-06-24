import 'package:bond/core/utils/validator.dart';
import 'package:bond/features/auth/data/api.dart';
import 'package:bond/features/auth/data/errors/validation_error.dart';
import 'package:bond/routes/app_router.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'login_notifier.dart';

part 'login_state.dart';

final loginNotifierProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(sl()),
);
