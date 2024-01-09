import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';

class QuizContainer extends StatelessWidget {
  final String image;
  final String title;
  final String totalQuestions;
  final Color color;

  const QuizContainer({
    super.key,
    required this.image,
    required this.title,
    required this.totalQuestions,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow:  [
          BoxShadow(
            color: color,
            blurRadius: 24,
            spreadRadius: 8,
            offset: const Offset(
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
            Image.network(
              image,
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 52,
            ),
            Text(
              title,
              style: AppFonts.s40w800.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '$totalQuestions вопросов',
              style: AppFonts.s20w600,
            ),
          ],
        ),
      ),
    );
  }
}
