import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter9/core/services/dio_settings/dio_settings.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/data_source/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/repositories/get_all_articles_repository_impl.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/data/repository_impl/user_quize_repository_impl.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/usecase/user_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/data/repositoty_impl/concrete_quize_repo_impl.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/use_cases/concrete_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/data/data_source/all_quizes_remote.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/data/repositoyt_impl/quizes_repository_impl.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/usecase/all_quizes_usecase.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  articlesDependecy();
  allQuizesDependency();
  concreteQuizeDependency();
  userQuizeDependency();
}

void articlesDependecy() {
  getIt.registerSingleton<DioSettings>(DioSettings());
  getIt.registerSingleton<GetAllArticlesRemoteDataSourceImpl>(
    GetAllArticlesRemoteDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<GetAllArticlesRepositoryImpl>(
    GetAllArticlesRepositoryImpl(
      dataSource: getIt<GetAllArticlesRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<GetAllArticlesUseCase>(
    GetAllArticlesUseCase(
      repo: getIt<GetAllArticlesRepositoryImpl>(),
    ),
  );
}

void allQuizesDependency() {
  getIt.registerSingleton<AllQuizesRemoteImpl>(
    AllQuizesRemoteImpl(dio: getIt<DioSettings>().dio),
  );
  getIt.registerSingleton<QuizesRepoImpl>(
    QuizesRepoImpl(
      remote: getIt<AllQuizesRemoteImpl>(),
    ),
  );
  getIt.registerSingleton<QuizesUseCase>(
    QuizesUseCase(
      repo: getIt<QuizesRepoImpl>(),
    ),
  );
}

void concreteQuizeDependency() {
  getIt.registerSingleton<ConcreteQuizeRemoteImpl>(
    ConcreteQuizeRemoteImpl(dio: getIt<DioSettings>().dio),
  );
  getIt.registerSingleton<ConcreteQuizeRepoImpl>(
    ConcreteQuizeRepoImpl(
      remote: getIt<ConcreteQuizeRemoteImpl>(),
    ),
  );
  getIt.registerSingleton<ConcreteQuizeUseCase>(
    ConcreteQuizeUseCase(
      repo: getIt<ConcreteQuizeRepoImpl>(),
    ),
  );
}

void userQuizeDependency() {
  getIt.registerSingleton<UserQuizeRemoteImpl>(
    UserQuizeRemoteImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<UserQuizeRepoImpl>(
    UserQuizeRepoImpl(
      remoteData: getIt<UserQuizeRemoteImpl>(),
    ),
  );
  getIt.registerSingleton<UserQuizeUseCase>(
    UserQuizeUseCase(
      repo: getIt<UserQuizeRepoImpl>(),
    ),
  );
}
