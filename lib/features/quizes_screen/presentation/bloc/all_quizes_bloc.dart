import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/entity/quizes_entity.dart';
import 'package:neobis_flutter_chapter9/features/quizes_screen/domain/usecase/all_quizes_usecase.dart';

part 'all_quizes_event.dart';
part 'all_quizes_state.dart';

class AllQuizesBloc extends Bloc<AllQuizesEvent, AllQuizesState> {
  final QuizesUseCase useCase;
  AllQuizesBloc(this.useCase) : super(AllQuizesInitial()) {
    _onGetAllQuizesEvent();
  }

  void _onGetAllQuizesEvent() {
     on<GetAllQuizesEvent>((event, emit) async {
      emit(
        AllQuizesLoading(),
      );
      try {
        final model = await useCase.getAllQuizesUseCase();
        emit(AllQuizesLoaded(model: model));
      } catch (e) {
        
        emit(
          AllQuizesError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
