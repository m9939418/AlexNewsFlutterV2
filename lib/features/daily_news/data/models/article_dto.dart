import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';

class ArticleDto extends ArticleEntity {
  const ArticleDto({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => ArticleDto(
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? "",
      );
}
