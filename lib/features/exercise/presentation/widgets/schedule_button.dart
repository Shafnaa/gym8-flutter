import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class ScheduleButton extends StatefulWidget {
  const ScheduleButton({
    super.key,
  });

  @override
  State<ScheduleButton> createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.zero,
          ),
          backgroundColor: MaterialStatePropertyAll(
            AppPallete.redColor,
          ),
          foregroundColor: MaterialStatePropertyAll(
            AppPallete.whiteColor,
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
        child: const Text(
          "M",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
