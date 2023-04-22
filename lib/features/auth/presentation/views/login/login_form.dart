import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/app_widgets.dart';
import 'package:bond/features/auth/presentation/providers/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.localizations.filed_email_label,
            prefixIcon: const Icon(Icons.email),
            errorText: loginState.emailError,
          ),
          onChanged: loginNotifier.updateEmail,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: context.localizations.filed_password_label,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(loginState.obscured
                  ? Icons.lock_outline
                  : Icons.lock_open_outlined),
              onPressed: loginNotifier.toggleObscured,
            ),
            errorText: loginState.passwordError,
          ),
          onChanged: loginNotifier.updatePassword,
          obscureText: loginState.obscured,
        ),
        const SizedBox(height: 16),
        AppButton(
          enabled: loginState.isValid,
          loading: loginState.loading,
          onPressed: loginNotifier.login,
          title: context.localizations.login_page_login_button,
        ),
      ],
    );
  }
}
