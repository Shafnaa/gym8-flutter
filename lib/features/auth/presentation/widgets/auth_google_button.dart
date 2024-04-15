import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class AuthGoogleButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthGoogleButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(480, 24),
        backgroundColor: AppPallete.whiteColor,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            height: 20,
            image: AssetImage('assets/google_icon.png'),
          ),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPallete.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
