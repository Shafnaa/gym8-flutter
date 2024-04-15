import 'package:flutter/material.dart';
import 'package:gym8/core/common/widgets/help_button.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String description;

  const AuthHeader({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: AppPallete.lightGrayColor,
              ),
            ),
          ],
        ),
        const HelpButton()
      ],
    );
  }
}
