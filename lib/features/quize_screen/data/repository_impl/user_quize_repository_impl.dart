import 'package:neobis_flutter_chapter9/features/quize_screen/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/repo/user_quize_repo.dart';

class UserQuizeRepoImpl implements UserQuizeRepo {
  final UserQuizeRemote remoteData;

  UserQuizeRepoImpl({required this.remoteData});

  @override
  Future<UserQuizeEntity> getUserQuizeRepo(int id) async {
    final userQuizeModel = await remoteData.getUserQuizeRemote(id);

    final quizesListEntity = userQuizeModel.answer
        ?.map((answersModel) => answersModel.toEntity())
        .toList();

    return UserQuizeEntity(
      quiz: userQuizeModel.quiz?.toEntity(),
      title: userQuizeModel.title,
      answer: quizesListEntity,
    );
  }
}
