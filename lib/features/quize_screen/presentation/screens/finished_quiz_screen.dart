import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';

class FiinishedQuizScreen extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;
  const FiinishedQuizScreen(
      {super.key, required this.totalScore, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Поздравляем!',
                  style: AppFonts.s32w700.copyWith(color: AppColors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Text(
                  'Вы ответили правильно на',
                  style: AppFonts.s18w800.copyWith(color: AppColors.black),
                ),
                Text(
                  '$totalScore из $totalQuestions вопросов',
                  style: AppFonts.s18w800.copyWith(
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'У вас всегда есть возможность пройти квиз\nзаново, чтобы еще раз проверить свои знания!',
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
                          .copyWith(
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                QuizElevatedButton(
                  title: 'Вернуться на главную',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
