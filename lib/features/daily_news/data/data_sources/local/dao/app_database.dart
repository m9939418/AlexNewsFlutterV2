import 'package:alex_news_api_f/features/daily_news/data/data_sources/local/dao/article_dao.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    ArticleDto
  ],
)
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}