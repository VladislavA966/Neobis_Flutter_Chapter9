import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/dependencies/dependency_injection.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/bloc/articles_bloc.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc(
        useCase: getIt<GetAllArticlesUseCase>(),
      ),
      child: MaterialApp(
        home: const MainScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
      ),
    );
  }
}
