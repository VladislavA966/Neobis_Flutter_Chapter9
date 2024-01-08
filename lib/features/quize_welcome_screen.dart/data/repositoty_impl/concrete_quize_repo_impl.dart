import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/data/data_source.dart/remote_data_source.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/entities/concrete_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/repo/concrete_quiz_repo.dart';

class ConcreteQuizeRepoImpl implements ConcreteQuizRepo {
  final ConcreteQuizeRemoteImpl remote;

  ConcreteQuizeRepoImpl({required this.remote});

  @override
  Future<ConcreteQuizesList> getConcreteQuiz(int id) async {
    final remoteData = await remote.getConcreteQuizRemote(id);
    return ConcreteQuizesList(
        result: remoteData.results.map((model) => model.toEntity()).toList());
  }
}
