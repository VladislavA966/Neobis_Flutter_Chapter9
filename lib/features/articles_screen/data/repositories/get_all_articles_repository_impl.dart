import 'package:neobis_flutter_chapter9/features/articles_screen/data/data_source/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/repo/get_all_atricles.dart';

class GetAllArticlesRepositoryImpl implements GetAllArticlesRepo {
  final GetAllArticlesRemoteDataSource dataSource;

  GetAllArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<AllArticlesEntity> getAllArticles() async {
    final dataSourceList = await dataSource.getAllArticlesRemoteDataSource();

    final articlesEntities = dataSourceList.articles
        .map((articleModel) => articleModel.toEntity())
        .toList();

    return AllArticlesEntity(result: articlesEntities);
  }

  @override
  Future<ArticlesEntity> getConcreteArticle(int id) async {
    final dataSourceArticle = await dataSource.getConcreteArticle(id);
    return ArticlesEntity(
        id: dataSourceArticle.id ?? 0,
        title: dataSourceArticle.title ?? '',
        content: dataSourceArticle.content ?? '',
        timeToRead: dataSourceArticle.timeToRead ?? 0,
        dateCreated: dataSourceArticle.dateCreated ?? '',
        isActive: dataSourceArticle.isActive ?? false,
        category: dataSourceArticle.category ?? 0);
  }
}
