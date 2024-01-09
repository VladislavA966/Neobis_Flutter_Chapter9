import 'package:neobis_flutter_chapter9/features/articles_screen/data/data_source/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/repo/get_all_atricles.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/domain/entities/concrete_article_entity.dart';

class GetAllArticlesRepositoryImpl implements GetAllArticlesRepo {
  final GetAllArticlesRemoteDataSource dataSource;

  GetAllArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<ArticlesEntity> getAllArticles() async {
    final dataSourceList = await dataSource.getAllArticlesRemoteDataSource();

    final articlesEntities = dataSourceList.results!
        .map((articleModel) => articleModel.toEntity())
        .toList();

    return ArticlesEntity(
        count: dataSourceList.count ?? 0,
        next: dataSourceList.next ?? '',
        previous: dataSourceList.previous ?? '',
        results: articlesEntities);
  }

  @override
  Future<ConcreteArticleEntity> getConcreteArticle(int id) async {
    final dataSourceArticle = await dataSource.getConcreteArticle(id);
    return ConcreteArticleEntity(
        id: dataSourceArticle.id ?? 0,
        title: dataSourceArticle.title ?? '',
        content: dataSourceArticle.content ?? '',
        isActive: dataSourceArticle.isActive ?? false,
        timeToRead: dataSourceArticle.timeToRead ?? 0,
        articleCover: dataSourceArticle.articleCover ?? '');
  }
}
