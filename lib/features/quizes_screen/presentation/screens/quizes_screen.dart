import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/screens/home_quizes_screen.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_container.dart';

class QuizesScreen extends StatefulWidget {
  const QuizesScreen({super.key});

  @override
  State<QuizesScreen> createState() => _QuizesScreenState();
}

class _QuizesScreenState extends State<QuizesScreen> {
  final List<String> imgList = [
    AppImages.philosofy,
    AppImages.history,
    AppImages.philosofy,
    AppImages.history,
    AppImages.philosofy,
    AppImages.history,
    AppImages.philosofy,
    AppImages.history,
    AppImages.philosofy,
    AppImages.history,
    AppImages.philosofy,
    AppImages.history,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Stack(
        children: [
          Image.asset(AppImages.appBarTitle),
          Text(
            'Все квизы',
            style: AppFonts.s18w800.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(height: 44),
        _buildStartQuizButton(),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: imgList.map((item) => QuizContainer(image: item)).toList(),
      ),
    );
  }

  Widget _buildStartQuizButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: QuizElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeQuizeScreen(),
            ),
          );
        },
      ),
    );
  }
}
