import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/entities/concrete_quize_use_case.dart';

abstract class ConcreteQuizRepo {
  Future<ConcreteQuizesList> getConcreteQuiz(int id);
}
