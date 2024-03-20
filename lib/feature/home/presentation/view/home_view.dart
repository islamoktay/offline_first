import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:offline_first/core/constant/app_constants.dart';
import 'package:offline_first/feature/home/presentation/provider/cubit/news_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            localDbError: (value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Local Db Error :(')),
            ),
          );
        },
        bloc: context.read<NewsCubit>()..newsFlow(),
        builder: (context, state) {
          return state.maybeMap(
            orElse: SizedBox.shrink,
            loading: (value) =>
                const Center(child: CircularProgressIndicator()),
            loaded: (value) => Center(
              child: ListView.builder(
                itemCount: value.articles.length,
                itemBuilder: (context, index) {
                  final article = value.articles[index];
                  return ListTile(
                    title: Text(article.titleVal ?? 'No Title'),
                    subtitle: Text(article.descriptionVal ?? 'No Description'),
                  );
                },
              ),
            ),
            error: (value) => Center(child: Text(value.message ?? 'Error')),
          );
        },
      ),
    );
  }
}
