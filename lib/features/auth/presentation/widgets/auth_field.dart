import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class AuthField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: AppPallete.whiteColor,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "$label is missing!";
            }
            return null;
          },
          obscureText: isObscureText,
        )
      ],
    );
  }
}
