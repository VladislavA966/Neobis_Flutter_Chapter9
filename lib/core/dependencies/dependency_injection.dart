import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter9/core/services/dio_settings/dio_settings.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/data_source/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/repositories/get_all_articles_repository_impl.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';

final getIt = GetIt.instance;

void setupDependencies() {
articlesDependecy();
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