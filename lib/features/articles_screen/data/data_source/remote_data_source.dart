import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/models/article_model_new.dart';
import 'package:neobis_flutter_chapter9/features/concrete_article_screen/data/models/concrete_article_model.dart';

abstract class GetAllArticlesRemoteDataSource {
  Future<ArticlesModel> getAllArticlesRemoteDataSource(
      String search, List<int> categories);
  Future<ConcreteArticleModel> getConcreteArticle(int id);
}

class GetAllArticlesRemoteDataSourceImpl
    implements GetAllArticlesRemoteDataSource {
  final Dio dio;

  GetAllArticlesRemoteDataSourceImpl({required this.dio});
  @override
  Future<ArticlesModel> getAllArticlesRemoteDataSource(
      String search, List<int> categories) async {
    Map<String, dynamic> queryParams = {
      'search': search,
    };

    if (categories.isNotEmpty) {
      queryParams['category'] = categories.map((c) => c.toString()).toList();
    }

    final response = await dio.get('/articles/', queryParameters: queryParams);
    final model = ArticlesModel.fromJson(response.data);
    if (response.statusCode == 200) {
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
