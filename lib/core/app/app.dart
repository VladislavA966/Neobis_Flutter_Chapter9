import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter9/core/dependencies/dependency_injection.dart';
import 'package:neobis_flutter_chapter9/core/recources/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/presentation/bloc/articles_bloc.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/presentation/bloc/concrete_article_bloc.dart';
import 'package:neobis_flutter_chapter9/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/usecase/user_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/presentation/bloc/user_quize_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/use_cases/concrete_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/presentation/bloc/concrete_quize_bloc.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/usecase/all_quizes_usecase.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/presentation/bloc/all_quizes_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserQuizeBloc(
            useCase: getIt<UserQuizeUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ConcreteArticleBloc(
            getIt<GetAllArticlesUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ArticlesBloc(
            useCase: getIt<GetAllArticlesUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ConcreteQuizeBloc(
            getIt<ConcreteQuizeUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => AllQuizesBloc(
            getIt<QuizesUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        home: const MainScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
      ),
    );
  }
}
