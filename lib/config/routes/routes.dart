import 'package:flutter/material.dart';

import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/pages/article_detail/article_detail_screen.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/pages/home/daily_news_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNewsScreen());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsScreen(article: settings.arguments as ArticleEntity));

      default:
        return _materialRoute(const DailyNewsScreen());
    }
  }

  static Route _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
