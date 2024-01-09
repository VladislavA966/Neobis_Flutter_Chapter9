import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/entities/concrete_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/repo/concrete_quiz_repo.dart';

class ConcreteQuizeUseCase {
  final ConcreteQuizRepo repo;

  ConcreteQuizeUseCase({required this.repo});

  Future<ConcreteQuizEntity> getConcreteQuizUseCase(int id) async {
    return await repo.getConcreteQuiz(id);
  }
}
