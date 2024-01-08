import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/repo/quizes_repo.dart';

class QuizesUseCase {
  final QuizesRepo repo;

  QuizesUseCase({required this.repo});
  Future<AllQuizesEntity> getAllQuizesUseCase() async {
    return await repo.getAllQuizesrepo();
  }
}
