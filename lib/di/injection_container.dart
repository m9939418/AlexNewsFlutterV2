import 'package:alex_news_api_f/features/daily_news/data/data_sources/remote/news_api.dart';
import 'package:alex_news_api_f/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/get_article.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApi>(NewsApi(sl()));

  // Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // UseCase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
