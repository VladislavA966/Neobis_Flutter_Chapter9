import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/data/models/user_quize_model.dart';

abstract class UserQuizeRemote {
  Future<UserQuizeModel> getUserQuizeRemote(int id);
}

class UserQuizeRemoteImpl implements UserQuizeRemote {
  final Dio dio;

  UserQuizeRemoteImpl({required this.dio});
  @override
  Future<UserQuizeModel> getUserQuizeRemote(int id) async {
    final responce = await dio.get('/quizzes/$id/questions/');
    final model = UserQuizeModel.fromJson(responce.data);
    if (responce.statusCode == 200) {
      return model;
    } else {
      throw Exception();
    }
  }
}
