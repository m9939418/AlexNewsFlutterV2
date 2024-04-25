import 'dart:async';

import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/get_saved_article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/remove_article_use_case.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/save_article_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'local_article_event.dart';

part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticlesEvent>(onGetSavedArticleState);
    on<SaveArticlesEvent>(onSaveArticleState);
    on<RemoveArticlesEvent>(onRemoveArticleState);
  }

  void onGetSavedArticleState(GetSavedArticlesEvent event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticleState(SaveArticlesEvent event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(param: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticleState(RemoveArticlesEvent event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(param: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
