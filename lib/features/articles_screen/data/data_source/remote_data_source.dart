import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/data/models/articles_model.dart';

abstract class GetAllArticlesRemoteDataSource {
  Future<ArticlesModelList> getAllArticlesRemoteDataSource();
  Future<ArticlesModel> getConcreteArticle(int id);
}

class GetAllArticlesRemoteDataSourceImpl
    implements GetAllArticlesRemoteDataSource {
  final Dio dio;

  GetAllArticlesRemoteDataSourceImpl({required this.dio});
  @override
  Future<ArticlesModelList> getAllArticlesRemoteDataSource() async {
    final responce = await dio.get('/articles/');
    final model = ArticlesModelList.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Error();
    }
  }

  @override
  Future<ArticlesModel> getConcreteArticle(int id) async {
    final responce = await dio.get('/articles/$id');
    final model = ArticlesModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Error();
    }
  }
}
