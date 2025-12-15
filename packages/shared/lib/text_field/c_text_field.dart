import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    required this.controller,
    super.key,
    this.focusNode,
    this.hint,
    this.inputAction,
    this.inputFormatters,
    this.inputType,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.onChange,
    this.validator,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: inputAction,
      focusNode: focusNode,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        hint: hint != null ? Text(hint!) : null,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      inputFormatters: inputFormatters,
    );
  }
}
