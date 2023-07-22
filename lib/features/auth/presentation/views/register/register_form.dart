import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/app_widgets.dart';
import 'package:bond/features/auth/presentation/providers/register/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerNotifierProvider);
    final registerNotifier = ref.read(registerNotifierProvider.notifier);
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: context.localizations.filed_name_label,
            prefixIcon: const Icon(Icons.person),
            errorText: registerState.nameError,
          ),
          onChanged: registerNotifier.updateName,
        ),
        const SizedBox(height: 12),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.localizations.filed_email_label,
            prefixIcon: const Icon(Icons.email),
            errorText: registerState.emailError,
          ),
          onChanged: registerNotifier.updateEmail,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: context.localizations.filed_password_label,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(registerState.obscured
                  ? Icons.lock_outline
                  : Icons.lock_open_outlined),
              onPressed: registerNotifier.toggleObscured,
            ),
            errorText: registerState.passwordError,
          ),
          onChanged: registerNotifier.updatePassword,
          obscureText: registerState.obscured,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: context.localizations.filed_password_label,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(registerState.obscuredConfirm
                  ? Icons.lock_outline
                  : Icons.lock_open_outlined),
              onPressed: registerNotifier.toggleObscuredConfirm,
            ),
            errorText: registerState.passwordConfirmationError,
          ),
          onChanged: registerNotifier.updatePasswordConfirmation,
          obscureText: registerState.obscuredConfirm,
        ),
        const SizedBox(height: 16),
        AppButton(
          enabled: registerState.isValid,
          loading: registerState.loading,
          onPressed: registerNotifier.register,
          title: context.localizations.login_page_register_button,
        ),
      ],
    );
  }
}
