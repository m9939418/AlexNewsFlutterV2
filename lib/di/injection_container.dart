import 'package:alex_news_api_f/features/daily_news/data/data_sources/local/dao/app_database.dart';
import 'package:alex_news_api_f/features/daily_news/data/data_sources/remote/news_api.dart';
import 'package:alex_news_api_f/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:alex_news_api_f/features/daily_news/domain/repository/article_repository.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/get_article_use_case.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/get_saved_article.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/remove_article_use_case.dart';
import 'package:alex_news_api_f/features/daily_news/domain/usecase/save_article_use_case.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Floor
  final database = await $FloorAppDatabase.databaseBuilder('app_database').build();
  sl.registerSingleton<AppDatabase>(database);

  /// Dio
  sl.registerSingleton<Dio>(Dio());

  /// Dependencies
  sl.registerSingleton<NewsApi>(NewsApi(sl()));

  /// Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  /// UseCase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  /// Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(sl(), sl(), sl()));
}
