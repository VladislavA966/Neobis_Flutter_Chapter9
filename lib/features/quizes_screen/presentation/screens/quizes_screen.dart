import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/presentation/home_quizes_screen.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/bloc/all_quizes_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_button.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/widgets/quize_container.dart';

class QuizesScreen extends StatefulWidget {
  const QuizesScreen({super.key});

  @override
  State<QuizesScreen> createState() => _QuizesScreenState();
}

class _QuizesScreenState extends State<QuizesScreen> {
  @override
  void initState() {
    BlocProvider.of<AllQuizesBloc>(context).add(
      GetAllQuizesEvent(),
    );
    super.initState();
  }

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
    return BlocBuilder<AllQuizesBloc, AllQuizesState>(
      builder: (context, state) {
        if (state is AllQuizesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllQuizesLoaded) {
          return Column(
            children: [
              _buildCarouselSlider(state),
              const SizedBox(height: 44),
              _buildStartQuizButton(state),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildCarouselSlider(AllQuizesLoaded state) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: state.model.quizes
            .map((item) => QuizContainer(
                  image: item.quizCover,
                  title: item.title,
                  totalQuestions: item.totalQuestions.toString(),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildStartQuizButton(AllQuizesLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: QuizElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomeQuizeScreen(id: state.model.quizes.first.id),
            ),
          );
        },
      ),
    );
  }
}
