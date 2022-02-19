import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class FixitTextField extends StatelessWidget {
  const FixitTextField({
    Key? key,
    required this.textFormBloc,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.suffixButton,
  }) : super(key: key);

  final TextFieldBloc textFormBloc;
  final String hint;
  final TextInputType keyboardType;
  final SuffixButton? suffixButton;

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textFieldBloc: textFormBloc,
      keyboardType: keyboardType,
      suffixButton: suffixButton,
      autofillHints: [
        hint,
      ],
      decoration: InputDecoration(
        labelText: hint,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 17,
        ),
      ),
    );
  }
}
