import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';

class QuizCard extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final int totalQuestions;
  final Color color;
  const QuizCard(
      {super.key,
      required this.image,
      required this.title,
      required this.totalQuestions,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Image.network(
                image,
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.s24w800.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '$totalQuestions вопросов',
                style: AppFonts.s12w600.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
