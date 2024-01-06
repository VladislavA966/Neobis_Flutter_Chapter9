import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset(
            AppImages.quizImage,
          ),
          const SizedBox(height: 28),
          Text(
            'История',
            style: AppFonts.s24w800.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            '10 вопросов',
            style: AppFonts.s12w600.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
