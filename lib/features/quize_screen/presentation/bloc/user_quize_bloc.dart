import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/entity/user_quize_entity.dart';
import 'package:neobis_flutter_chapter9/features/quize_screen/domain/usecase/user_quize_use_case.dart';

part 'user_quize_event.dart';
part 'user_quize_state.dart';

class UserQuizeBloc extends Bloc<UserQuizeEvent, UserQuizeState> {
  final UserQuizeUseCase useCase;
  UserQuizEntityList? quizData;
  int currentQuestionIndex = 0;
  UserQuizeBloc({required this.useCase}) : super(UserQuizeInitial()) {
    on<GetAllAnswersEvent>(_onLoadQuiz);
  }
  void _onLoadQuiz(
      GetAllAnswersEvent event, Emitter<UserQuizeState> emit) async {
    emit(UserQuizeLoading());
    try {
      final model = await useCase.call(event.id);
      emit(UserQuizeLoaded(model: model),);
    } catch (e) {
      emit(
        UserQuizeError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
