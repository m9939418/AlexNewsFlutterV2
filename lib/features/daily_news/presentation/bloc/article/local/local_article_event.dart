part of 'local_article_bloc.dart';

@immutable
sealed class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}


class GetSavedArticlesEvent extends LocalArticleEvent {
  const GetSavedArticlesEvent();
}

class SaveArticlesEvent extends LocalArticleEvent {
  const SaveArticlesEvent(ArticleEntity article) : super(article: article);
}

class RemoveArticlesEvent extends LocalArticleEvent {
  const RemoveArticlesEvent(ArticleEntity article) : super(article: article);
}
