import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/data/models/concrete_quize_model.dart';

abstract class ConcreteQuizeRemote {
  Future<ConcreteQuizeListModel> getConcreteQuizRemote(int id);
}

class ConcreteQuizeRemoteImpl implements ConcreteQuizeRemote {
  final Dio dio;

  ConcreteQuizeRemoteImpl({required this.dio});
  @override
  Future<ConcreteQuizeListModel> getConcreteQuizRemote(int id) async {
    final responce = await dio.get('/quizzes/$id/welcome/');
    final model = ConcreteQuizeListModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Exception();
    }
  }
}
