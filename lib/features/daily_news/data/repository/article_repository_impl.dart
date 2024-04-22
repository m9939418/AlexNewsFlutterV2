import 'dart:io';

import 'package:alex_news_api_f/core/constants/constants.dart';
import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/data/data_sources/remote/news_api.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApi _newsApi;

  ArticleRepositoryImpl(this._newsApi);

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
}
