import 'package:flutter/material.dart';

class TextFieldScreen extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String? hintText;
  final Widget? hidePassword;
  final Function(String)? onChanged;
  final String Function(String?)? validator;
  final Widget? suffixIcon;

  const TextFieldScreen({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.hintText,
    this.hidePassword,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      autocorrect: false,
      autofocus: true,
      keyboardType: keyboardType ?? TextInputType.name,
      textAlign: TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(fontSize: 16),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFFD4D4D4), width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
