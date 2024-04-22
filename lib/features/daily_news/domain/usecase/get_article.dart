import 'package:alex_news_api_f/core/resources/data_state.dart';
import 'package:alex_news_api_f/core/usecase/usecase.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleDto>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleDto>>> call({void param}) {
    return _articleRepository.getNewsArticles();
  }
}
