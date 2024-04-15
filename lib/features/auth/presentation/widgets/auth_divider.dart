import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: AppPallete.whiteColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "or",
          ),
        ),
        Expanded(
          child: Divider(
            color: AppPallete.whiteColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
