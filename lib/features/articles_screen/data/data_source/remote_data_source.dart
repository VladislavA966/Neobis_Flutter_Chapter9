import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/models/article_model_new.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/data/models/concrete_article_model.dart';

abstract class GetAllArticlesRemoteDataSource {
  Future<ArticlesModel> getAllArticlesRemoteDataSource();
  Future<ConcreteArticleModel> getConcreteArticle(int id);
}

class GetAllArticlesRemoteDataSourceImpl
    implements GetAllArticlesRemoteDataSource {
  final Dio dio;

  GetAllArticlesRemoteDataSourceImpl({required this.dio});
  @override
  Future<ArticlesModel> getAllArticlesRemoteDataSource() async {
    final responce = await dio.get('/articles/');
    final model = ArticlesModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Error();
    }
  }

  @override
  Future<ConcreteArticleModel> getConcreteArticle(int id) async {
    final responce = await dio.get('/articles/$id');
    final model = ConcreteArticleModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Error();
    }
  }
}
