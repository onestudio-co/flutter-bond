import 'package:bond/core/utils/validator.dart';
import 'package:bond/features/auth/data/api.dart';
import 'package:bond/features/auth/data/errors/validation_error.dart';
import 'package:bond/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

part 'login_notifier.dart';

part 'login_state.dart';

final loginNotifierProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(sl()),
);
