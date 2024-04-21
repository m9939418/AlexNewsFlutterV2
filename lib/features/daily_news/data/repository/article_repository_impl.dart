import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<ArticleEntity>> getNewsArticles() {
    throw UnimplementedError();
  }
}
