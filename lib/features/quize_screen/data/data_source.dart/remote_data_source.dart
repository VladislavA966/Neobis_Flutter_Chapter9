import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/data/models/user_quize_model.dart';

abstract class UserQuizeRemote {
  Future<UserQuizeModelList> getUserQuizeRemote(int id);
}

class UserQuizeRemoteImpl implements UserQuizeRemote {
  final Dio dio;

  UserQuizeRemoteImpl({required this.dio});

  @override
  Future<UserQuizeModelList> getUserQuizeRemote(int id) async {
    try {
      final response = await dio.get('/quizzes/$id/questions/');

      if (response.statusCode == 200) {
        final model = UserQuizeModelList.fromJson(response.data);

        return model;
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
