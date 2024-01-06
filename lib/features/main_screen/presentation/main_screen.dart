import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/screens/articles_screen.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/article_container.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/button_row.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/widgets/quiz_card.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/screens/quizes_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ArticlesContainer(
              onTap: () {
                // Navigator.push...
              },
            ),
          );
        },
      ),
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
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const QuizCard();
        },
      ),
    );
  }
}
