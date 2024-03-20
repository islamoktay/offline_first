import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:offline_first/core/dependency_injection/di.dart';
import 'package:offline_first/core/services/navigation_service/i_navigation_service.dart';
import 'package:offline_first/feature/home/presentation/provider/cubit/news_cubit.dart';
import 'package:offline_first/feature/home/presentation/view/home_view.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());
  void navigateToHomeView({
    required BuildContext context,
    required INavigationService navigationService,
  }) {
    Future.delayed(const Duration(seconds: 2), () async {
      await navigationService.pushReplacement(
        context,
        BlocProvider<NewsCubit>(
          create: (inner) => sl<NewsCubit>(),
          child: const HomeView(),
        ),
      );
    });
  }
}
