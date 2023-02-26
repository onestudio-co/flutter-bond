import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppPasswordTextFormField extends HookWidget {
  const AppPasswordTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.errorText,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String? errorText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final obscured = useState<bool>(true);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(obscured.value
              ? Icons.lock_outline
              : Icons.lock_open_outlined),
          onPressed: () => obscured.value = !obscured.value,
        ),
        errorText: errorText,
      ),
      obscureText: obscured.value,
      autofocus: autofocus,
    );
  }
}
