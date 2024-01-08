import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';

abstract class QuizesRepo {
  Future<AllQuizesEntity> getAllQuizesrepo();
  
}
