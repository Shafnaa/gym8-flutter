import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        shadowColor: AppPallete.whiteColor,
      ),
      child: const Row(
        children: [
          Image(
            height: 24,
            image: AssetImage("assets/cs_icon.png"),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            "Help",
            style: TextStyle(
              color: AppPallete.whiteColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
