import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CustomTextFeildBlocWidget extends StatelessWidget {
  CustomTextFeildBlocWidget(
      {Key? key,
      required this.controller,
      this.suffixButton,
      this.label,
      this.icon,
      this.textInputType})
      : super(key: key);

  TextFieldBloc controller;
  SuffixButton? suffixButton;
  String? label;
  TextInputType? textInputType;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      suffixButton: suffixButton,
      enableSuggestions: false,
      autocorrect: false,
      textFieldBloc: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
      ),
    );
  }
}
