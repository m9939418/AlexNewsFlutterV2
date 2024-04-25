part of 'local_article_bloc.dart';

@immutable
sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

final class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

final class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}
