import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/entity/all_articles_entity.dart';
import 'package:neobis_flutter_chapter9/features/articles_screen/domain/usecases/get_all_articles.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetAllArticlesUseCase useCase;
  ArticlesBloc({required this.useCase}) : super(ArticlesInitial()) {
    getAllArticlesEvent();
    getConcreteArticleEvent();
  }

  void getAllArticlesEvent() {
    on<GetAllArticlesEvent>(
      (event, emit) async {
        emit(ArticlesLoading());
        try {
          final model = await useCase.getArticles();
          emit(
            ArticlesLoaded(model: model),
          );
        } catch (e) {
          emit(
            ArticlesError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }

  void getConcreteArticleEvent() {
    on<GetConcreteArticleEvent>(
      (event, emit) async {
        emit(
          ArticlesLoading(),
        );
        try {
          final model = await useCase.getConcreteArticle(event.id);
          emit(
            ConcreteArticleLoaded(model: model),
          );
        } catch (e) {
          emit(
            ArticlesError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
}