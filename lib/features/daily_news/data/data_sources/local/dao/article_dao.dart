import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleDto article);

  @delete
  Future<void> deleteArticle(ArticleDto article);

  @Query('select * from article')
  Future<List<ArticleDto>> getArticles();
}
