import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_fonts.dart/app_fonts.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/presentation/bloc/concrete_article_bloc.dart';

class ArticleInfoScreen extends StatefulWidget {
  final int id;
  const ArticleInfoScreen({super.key, required this.id});

  @override
  State<ArticleInfoScreen> createState() => _ArticleInfoScreenState();
}

class _ArticleInfoScreenState extends State<ArticleInfoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ConcreteArticleBloc>(context).add(
      GetConcreteArticleEvent(id: widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: _buildArticleContent(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Widget _buildArticleContent() {
    return BlocBuilder<ConcreteArticleBloc, ConcreteArticleState>(
      builder: (context, state) {
        if (state is ConcreteArticleLoaded) {
          return _buildArticleDetails(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildArticleDetails(ConcreteArticleLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(state.model.title,
            softWrap: true,
            style: AppFonts.s24w800.copyWith(color: AppColors.black)),
        const SizedBox(height: 16),
        _buildArticleMetaData(state.model.timeToRead, 'Какой то хэштег'),
        const SizedBox(height: 17),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              state.model.content,
              style: AppFonts.s16w500.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArticleMetaData(int timeToRead, String type) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
              text: '#$type',
              style: AppFonts.s12w600.copyWith(color: AppColors.black)),
          const WidgetSpan(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Text('●', style: TextStyle(fontSize: 12)),
            ),
          ),
          TextSpan(
              text: '$timeToRead minutes',
              style: AppFonts.s12w600.copyWith(color: AppColors.black)),
        ],
      ),
    );
  }
}
