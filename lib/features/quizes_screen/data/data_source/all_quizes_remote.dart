import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/data/models/quizes_model.dart';

abstract class AllQuizesRemote {
  Future<QuizesModel> getAllQuizesRemote();
 
}

class AllQuizesRemoteImpl implements AllQuizesRemote {
  final Dio dio;

  AllQuizesRemoteImpl({required this.dio});
  @override
  Future<QuizesModel> getAllQuizesRemote() async {
    final responce = await dio.get('/quizzes/');
    final model = QuizesModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Exception();
    }
  }
  


}
