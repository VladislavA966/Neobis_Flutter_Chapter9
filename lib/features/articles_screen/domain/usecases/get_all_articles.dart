import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/repo/get_all_atricles.dart';

class GetAllArticlesUseCase {
  final GetAllArticlesRepo repo;

  GetAllArticlesUseCase({required this.repo});
  Future<AllArticlesEntity> getArticles() async {
    return repo.getAllArticles();
  }

  Future<ArticlesEntity> getConcreteArticle(int id) async {
    return repo.getConcreteArticle(id);
  }
}
