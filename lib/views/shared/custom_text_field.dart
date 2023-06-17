import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20, color: CustomColors.primaryPurple),
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        hintText: hintText,
        hintStyle:
            const TextStyle(fontSize: 20, color: CustomColors.primaryPurple),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.primaryPurple),
          borderRadius: BorderRadius.circular(45),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.primaryPurple),
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    );
  }
}
