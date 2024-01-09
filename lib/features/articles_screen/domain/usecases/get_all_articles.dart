import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/repo/get_all_atricles.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/domain/entities/concrete_article_entity.dart';

class GetAllArticlesUseCase {
  final GetAllArticlesRepo repo;

  GetAllArticlesUseCase({required this.repo});
  Future<ArticlesEntity> getArticles() async {
    return repo.getAllArticles();
  }

  Future<ConcreteArticleEntity> getConcreteArticle(int id) async {
    return repo.getConcreteArticle(id);
  }
}
