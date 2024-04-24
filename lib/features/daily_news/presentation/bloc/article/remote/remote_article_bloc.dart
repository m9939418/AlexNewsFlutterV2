import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/get_article_use_case.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  void onGetArticles(
    GetArticlesEvent event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
