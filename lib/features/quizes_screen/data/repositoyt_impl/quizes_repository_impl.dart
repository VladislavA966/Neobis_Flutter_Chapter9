import 'package:neobis_flutter_chapter9/features/quizes_screen/data/data_source/all_quizes_remote.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/repo/quizes_repo.dart';

class QuizesRepoImpl implements QuizesRepo {
  final AllQuizesRemoteImpl remote;

  QuizesRepoImpl({required this.remote});
  @override
  Future<QuizesEntity> getAllQuizesrepo() async {
    final dataSourceList = await remote.getAllQuizesRemote();
    final quizesEntities = dataSourceList.results!
        .map((quizeModel) => quizeModel.toEntity())
        .toList();
    return QuizesEntity(
        count: dataSourceList.count ?? 0,
        next: dataSourceList.next ?? '',
        previous: dataSourceList.previous ?? '',
        results: quizesEntities);
  }
}
