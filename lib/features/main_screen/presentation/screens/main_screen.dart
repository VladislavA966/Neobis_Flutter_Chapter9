import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/bloc/articles_bloc.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/screens/articles_screen.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/article_info_screen.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/article_container.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/button_row.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/quiz_card.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/presentation/home_quizes_screen.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/bloc/all_quizes_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/screens/quizes_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> myColors = [
    AppColors.aqua,
    AppColors.blush,
    AppColors.burgundy,
    AppColors.darkRed,
    AppColors.lavender,
    AppColors.lightBlue,
    AppColors.lightGreen,
    AppColors.lightPink,
    AppColors.lime,
    AppColors.orange,
    AppColors.paleGreen,
    AppColors.peach
  ];
  Color getRandomColor() {
    Random random = Random();
    return myColors[random.nextInt(myColors.length)];
  }

  @override
  void initState() {
    BlocProvider.of<ArticlesBloc>(context).add(
      GetAllArticlesEvent(),
    );
    BlocProvider.of<AllQuizesBloc>(context).add(
      GetAllQuizesEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildArticlesButtonRow(),
              const SizedBox(height: 24),
              _buildArticlesList(),
              const SizedBox(height: 45),
              _buildQuizzesButtonRow(),
              const SizedBox(height: 5),
              _buildQuizzesGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesButtonRow() {
    return ButtonRow(
      title: 'Статьи',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ArticlesScreen(),
          ),
        );
      },
    );
  }

  Widget _buildArticlesList() {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoaded) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ArticlesContainer(
                    color: getRandomColor(),
                    categoty: state.model.results[index].category.name,
                    title: state.model.results[index].title,
                    image: state.model.results[index].articleCover,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleInfoScreen(
                            id: state.model.results[index].id,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildQuizzesButtonRow() {
    return ButtonRow(
      title: 'Квизы',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizesScreen(),
          ),
        );
      },
    );
  }

  Widget _buildQuizzesGrid() {
    return BlocBuilder<AllQuizesBloc, AllQuizesState>(
      builder: (context, state) {
        if (state is AllQuizesLoaded) {
          return Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: state.model.results.length,
              itemBuilder: (BuildContext context, int index) {
                return QuizCard(
                  color: getRandomColor(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeQuizeScreen(
                          id: state.model.results[index].id,
                        ),
                      ),
                    );
                  },
                  image: state.model.results[index].quizCover,
                  title: state.model.results[index].title,
                  totalQuestions: state.model.results[index].totalQuestions,
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
