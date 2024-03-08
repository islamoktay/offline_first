import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:offline_first/core/constant/gen/assets.gen.dart';
import 'package:offline_first/core/dependency_injection/di.dart';
import 'package:offline_first/core/services/local_db_service/i_local_db_service.dart';
import 'package:offline_first/core/services/navigation_service/i_navigation_service.dart';
import 'package:offline_first/core/services/network_service/i_network_service.dart';
import 'package:offline_first/feature/home/data/repo/home_repo.dart';
import 'package:offline_first/feature/home/domain/usecase/get_news_from_local_db_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/get_news_from_network_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/save_news_to_local_db_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/watch_news_from_local_db_usecase.dart';
import 'package:offline_first/feature/home/presentation/provider/cubit/news_cubit.dart';
import 'package:offline_first/feature/home/presentation/view/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToHomeView(context);
    return Scaffold(
      body: Center(
        child: Assets.splashAnimation.lottie(
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void navigateToHomeView(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final localDBService = sl<ILocalDBService>();
      final networkService = sl<INetworkService>();
      await sl<INavigationService>().pushReplacement(
        context,
        BlocProvider(
          create: (context) => NewsCubit(
            GetNewsFromNetworkUsecase(HomeRepo(networkService)),
            WatchNewsFromLocalDBUsecase(localDBService),
            SaveNewsToLocalDBUsecase(localDBService),
            GetNewsFromLocalDBUsecase(localDBService),
          ),
          child: HomeView(
            newsCubit: context.read<NewsCubit>(),
          ),
        ),
      );
    });
  }
}
