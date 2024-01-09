import 'package:neobis_flutter_chapter9/features/quize_screen/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/repo/user_quize_repo.dart';

class UserQuizeRepoImpl implements UserQuizeRepo {
  final UserQuizeRemote remoteData;

  UserQuizeRepoImpl({required this.remoteData});

  @override
  Future<UserQuizEntityList> getUserQuizeRepo(int id) async {
    final dataSourceList = await remoteData.getUserQuizeRemote(id);

    if (dataSourceList.modelsList != null) {
      final entitiesList =
          dataSourceList.modelsList!.map((model) => model.toEntity()).toList();

      return UserQuizEntityList(entityList: entitiesList);
    } else {
      throw Exception("Ошибка получения данных: список моделей пуст");
    }
  }
}
