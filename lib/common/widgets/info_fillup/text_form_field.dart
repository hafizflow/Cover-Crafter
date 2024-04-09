import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.maxLength,
    this.controller,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final IconData prefixIcon;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        label: Text(label),
        counterText: '',
      ),
    );
  }
}
