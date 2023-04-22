import 'package:bond/core/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'register_notifier.dart';

part 'register_state.dart';

final registerNotifierProvider = NotifierProvider<RegisterNotifier, RegisterState>(
  () => RegisterNotifier(),
);
