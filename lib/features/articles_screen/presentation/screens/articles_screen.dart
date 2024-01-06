import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_images/app_images.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/bloc/articles_bloc.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/screens/article_info_screen.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/screens/articles_filter_screen.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/article_container.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/common_text_field.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/widgets/filter_button.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticlesBloc>(context).add(GetAllArticlesEvent());
  }

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
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
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
        const Expanded(child: FindArticlesTextField()),
        const SizedBox(width: 16),
        FilterButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticlesFilterScreen(),
            ),
          ),
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
      itemCount: state.model.result.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ArticleContainer(
            title: state.model.result[index].title,
            timeToRead: state.model.result[index].timeToRead,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ArticleInfoScreen(id: state.model.result[index].id),
              ),
            ),
          ),
        );
      },
    );
  }
}
