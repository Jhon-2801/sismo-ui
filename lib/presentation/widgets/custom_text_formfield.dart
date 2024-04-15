import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final String? errorMessage;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isValidate;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField(
      {super.key,
      required this.label,
      this.onChanged,
      this.keyboardType,
      this.obscureText = false,
      this.errorMessage,
      this.isValidate = false,
      this.initialValue,
      this.suffixIcon,
      this.maxLines = 1,
      this.controller,
      this.inputFormatters,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (isValidate) {
            if (value == null || value.isEmpty) {
              return 'Campo obligatorio';
            } else {
              return null;
            }
          }
          return null;
        },
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: inputDecoration2(suffixIcon),
        keyboardType: keyboardType,
        obscureText: obscureText,
        initialValue: initialValue,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  InputDecoration inputDecoration() => InputDecoration(
      label: Text(label),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green, // Cambia el color aquí
          width: 1.0,
        ),
      ),
      errorText: errorMessage,
      border: const OutlineInputBorder());

  InputDecoration inputDecoration2(suffixIcon) => InputDecoration(
      label: Text(label), errorText: errorMessage, suffixIcon: suffixIcon);
}
