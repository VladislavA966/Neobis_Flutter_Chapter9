import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';

class QuizContainer extends StatelessWidget {
  final String image;

  const QuizContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.paleGreen,
        boxShadow: const [
          BoxShadow(
            color: AppColors.paleGreen,
            blurRadius: 24,
            spreadRadius: 8,
            offset: Offset(
              0,
              0,
            ),
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 52,
            ),
            Text(
              'Философия', 
              style: AppFonts.s40w800.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              '10 вопросов', 
              style: AppFonts.s20w600,
            ),
          ],
        ),
      ),
    );
  }
}