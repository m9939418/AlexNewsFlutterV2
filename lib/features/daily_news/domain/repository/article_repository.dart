import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';


abstract class ArticleRepository {
  Future<DataState<List<ArticleDto>>> getNewsArticles();
}
