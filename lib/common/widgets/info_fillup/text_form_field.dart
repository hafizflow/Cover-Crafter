import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.maxLength,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
  });

  final String label;
  final int? maxLength;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLength: maxLength,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        counterText: '',
        label: Text(label),
        prefixIcon: Icon(prefixIcon),
      ),
      readOnly: readOnly,
    );
  }
}
