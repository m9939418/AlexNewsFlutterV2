import 'package:alex_news_api_f/core/constants/constants.dart';
import 'package:alex_news_api_f/features/daily_news/data/models/article_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleDto>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
