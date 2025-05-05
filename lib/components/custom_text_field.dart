import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyBoardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    int? maxLines,
    TextInputType? keyBoardType,
  }) : maxLines = maxLines ?? 1,
       keyBoardType = keyBoardType ?? TextInputType.multiline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Enter $label',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'Enter $label';
        } else {
          return null;
        }
      },
    );
  }
}
