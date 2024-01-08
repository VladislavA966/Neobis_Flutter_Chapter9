import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';

abstract class UserQuizeRepo {
  Future<UserQuizeEntity> getUserQuizeRepo(int id);
}
