import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/bloc/articles_bloc.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/presentation/article_info_screen.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/screens/articles_filter_screen.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/article_container.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/common_text_field.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/filter_button.dart';

class ArticlesScreen extends StatefulWidget {
  List<int> categories = [];
  ArticlesScreen({super.key, this.categories = const []});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticlesBloc>(context).add(
      GetAllArticlesEvent(
          search: controller.text, categories: widget.categories),
    );
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildSearchAndFilterRow(),
            const SizedBox(height: 25),
            _buildArticlesList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Stack(
        children: [
          Image.asset(AppImages.appBarTitle),
          Text('Все статьи',
              style: AppFonts.s18w800.copyWith(color: AppColors.black)),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
            child: FindArticlesTextField(
          onChanged: (value) {
            setState(() {});
            controller.text = value;
            BlocProvider.of<ArticlesBloc>(context).add(
              GetAllArticlesEvent(search: controller.text),
            );
          },
          controller: controller,
        )),
        const SizedBox(width: 16),
        FilterButton(
          onTap: () async {
            final selectedCategories = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ArticlesFilterScreen(),
              ),
            );
            if (selectedCategories != null) {
              setState(() {
                widget.categories = selectedCategories;
              });
              // ignore: use_build_context_synchronously
              BlocProvider.of<ArticlesBloc>(context).add(
                GetAllArticlesEvent(categories: widget.categories),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildArticlesList() {
    return Expanded(
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticlesLoaded) {
            return _buildArticlesListView(state);
          } else if (state is ArticlesError) {
            return const Center(child: Text('Что-то пошло не так'));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildArticlesListView(ArticlesLoaded state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.model.results.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ArticleContainer(
            type: state.model.results[index].category.name,
            color: getRandomColor(),
            title: state.model.results[index].title,
            timeToRead: state.model.results[index].timeToRead,
            image: state.model.results[index].articleCover,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ArticleInfoScreen(id: state.model.results[index].id),
              ),
            ),
          ),
        );
      },
    );
  }
}
