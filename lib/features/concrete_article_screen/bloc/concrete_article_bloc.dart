import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';

part 'concrete_article_event.dart';
part 'concrete_article_state.dart';

class ConcreteArticleBloc
    extends Bloc<ConcreteArticleEvent, ConcreteArticleState> {
  final GetAllArticlesUseCase useCase;

  ConcreteArticleBloc(this.useCase) : super(ConcreteArticleInitial()) {
    getConcreteArticleEvent();
  }
  void getConcreteArticleEvent() {
    on<GetConcreteArticleEvent>(
      (event, emit) async {
        emit(
          ConcreteArticleLoading(),
        );
        try {
          final model = await useCase.getConcreteArticle(event.id);
          emit(
            ConcreteArticleLoaded(model: model),
          );
        } catch (e) {
          emit(
            ConcreteArticleError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
}
