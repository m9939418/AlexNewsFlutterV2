import 'package:alex_news_api_f/features/daily_news/domain/entities/article.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:alex_news_api_f/di/injection_container.dart';
import 'package:alex_news_api_f/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

class SavedArticleScreen extends HookWidget {
  const SavedArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<LocalArticleBloc>()..add(const GetSavedArticlesEvent()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
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
      title: const Text(
        'Saved Articles',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalArticlesDone) {
          return _buildArticleList(state.articles!);
        }
        return Container();
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildArticleList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      const Text(
        'NO SAVED ARTICLE',
        style: TextStyle(color: Colors.black),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) => ArticleWidget(
        article: articles[index],
        isRemovable: true,
        onArticlePressed: (article) => _onArticlePressed(context, article),
      ),
      itemCount: articles.length,
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(
      context,
      '/ArticleDetails',
      arguments: article,
    );
  }
}
