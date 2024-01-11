import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/domain/entities/concrete_article_entity.dart';

abstract class GetAllArticlesRepo {
  Future<ArticlesEntity> getAllArticles(String search, List<int> categories);
  Future<ConcreteArticleEntity> getConcreteArticle(int id);
}
