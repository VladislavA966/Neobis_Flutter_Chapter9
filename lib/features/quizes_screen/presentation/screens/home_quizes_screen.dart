import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';

class HomeQuizeScreen extends StatefulWidget {
  const HomeQuizeScreen({super.key});

  @override
  State<HomeQuizeScreen> createState() => _HomeQuizeScreenState();
}

class _HomeQuizeScreenState extends State<HomeQuizeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 11),
              _buildQuizTitle(),
              const SizedBox(height: 68),
              _buildQuizImage(),
              const SizedBox(height: 32),
              _buildQuizDescription(),
              const Spacer(),
              _buildStartQuizButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizTitle() {
    return Stack(
      children: [
        Image.asset(AppImages.bgTitleImage),
        Text(
          'Квиз "История"',
          style: AppFonts.s32w700.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget _buildQuizImage() {
    return Image.asset(AppImages.history);
  }

  Widget _buildQuizDescription() {
    return Text(
      'Добро пожаловать на квиз по истории. Это увлекательное путешествие через века и эпохи, которые сформировали наш мир таким, каким мы его знаем сегодня. В этом квизе вы окунетесь в важнейшие события, великих личностей и ключевые моменты, которые оказали огромное влияние на развитие человечества.',
      textAlign: TextAlign.center,
      style: AppFonts.s16w500.copyWith(color: AppColors.black),
    );
  }

  Widget _buildStartQuizButton() {
    return QuizElevatedButton(onPressed: () {});
  }
}
