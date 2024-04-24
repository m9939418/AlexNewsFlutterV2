import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  /// API method
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  /// Database method
  Future<List<ArticleDto>> getSaveArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
