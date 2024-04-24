import 'dart:io';

import 'package:alex_news_api_f/core/constants/constants.dart';
import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/data/data_sources/local/dao/app_database.dart';
import 'package:alex_news_api_f/features/daily_news/data/data_sources/remote/news_api.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApi _newsApi;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApi, this._appDatabase);

  @override
  Future<DataState<List<ArticleDto>>> getNewsArticles() async {
    try {
      final response = await _newsApi.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.response,
            requestOptions: response.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleDto>> getSaveArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleDto.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleDto.fromEntity(article));
  }
}
