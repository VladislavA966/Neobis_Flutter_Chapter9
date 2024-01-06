import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';

abstract class GetAllArticlesRepo {
  Future<AllArticlesEntity> getAllArticles();
  Future<ArticlesEntity> getConcreteArticle(int id);
}
