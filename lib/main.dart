import 'package:alex_news_api_f/config/theme/app_theme.dart';
import 'package:alex_news_api_f/di/injection_container.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const DailyNews()),
    );
  }
}
