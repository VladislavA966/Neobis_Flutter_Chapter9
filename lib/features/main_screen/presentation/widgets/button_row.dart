import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';

class ButtonRow extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ButtonRow({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.s32w700.copyWith(
              color: AppColors.black,
            ),
          ),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
