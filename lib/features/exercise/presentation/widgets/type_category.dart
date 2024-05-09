import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';

class TypeCategory extends StatelessWidget {
  const TypeCategory({
    super.key,
    required this.id,
    required this.name,
  });

  final int id;

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: AppPallete.typesColors[id - 1],
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Text(
        name ?? "",
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
