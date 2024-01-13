import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/entities/concrete_quize_use_case.dart';
import 'package:neobis_flutter_chapter9/features/quize_welcome_screen.dart/domain/use_cases/concrete_quize_use_case.dart';

part 'concrete_quize_event.dart';
part 'concrete_quize_state.dart';

class ConcreteQuizeBloc extends Bloc<ConcreteQuizeEvent, ConcreteQuizeState> {
  final ConcreteQuizeUseCase useCase;
  ConcreteQuizeBloc(this.useCase) : super(ConcreteQuizeInitial()) {
    onGetConcreteQuizeEvent();
  }

  void onGetConcreteQuizeEvent() {
      on<GetConcreteQuizeEvent>((event, emit) async {
      emit(
        ConcreteQuizeLoading(),
      );
      try {
        final model = await useCase.getConcreteQuizUseCase(event.id);
        emit(
          ConcreteQuizeLoaded(model: model),
        );
      } catch (e) {
        emit(
          ConcreteQuizeError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
