import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/repo/user_quize_repo.dart';

class UserQuizeUseCase {
  final UserQuizeRepo repo;

  UserQuizeUseCase({required this.repo});
  Future<UserQuizEntityList> call(int id) async {
    return await repo.getUserQuizeRepo(id);
  }
}
