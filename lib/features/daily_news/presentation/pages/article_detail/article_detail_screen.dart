import 'package:alex_news_api_f/di/injection_container.dart';
import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleDetailsScreen({
    Key? key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => _onBackButtonTapped(context),
            child: const Icon(
              Ionicons.chevron_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndData(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Text(
            article!.title!,
            style: const TextStyle(
              fontFamily: 'Butler',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.time_outline,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                article!.publishedAt!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        article!.urlToImage!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Text(
      '${article!.description ?? ''}\n\n${article!.content ?? ''}',
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          onPressed: () => _onFloatingActionButtonPressed(context),
          child: const Icon(
            Ionicons.book,
            color: Colors.white,
          ),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticlesEvent(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Article saved successfully'),
        backgroundColor: Colors.black,
      ),
    );
  }
}
