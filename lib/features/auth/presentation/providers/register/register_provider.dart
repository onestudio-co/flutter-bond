import 'package:bond/core/utils/validator.dart';
import 'package:bond/features/auth/data/api.dart';
import 'package:bond_core/bond_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../routes/app_router.dart';
import '../../../data/errors/validation_error.dart';

part 'register_notifier.dart';

part 'register_state.dart';

final registerNotifierProvider = NotifierProvider<RegisterNotifier, RegisterState>(
  () => RegisterNotifier(sl()),
);
