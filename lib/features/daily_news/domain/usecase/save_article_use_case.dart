import 'package:alex_news_api_f/core/usecase/usecase.dart';
import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? param}) {
    return _articleRepository.saveArticle(param!);
  }
}