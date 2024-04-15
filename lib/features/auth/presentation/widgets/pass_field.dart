import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class PassField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const PassField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  // show the password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            color: AppPallete.whiteColor,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.label} is missing!";
            }
            return null;
          },
          obscureText: _isObscure,
        )
      ],
    );
  }
}
