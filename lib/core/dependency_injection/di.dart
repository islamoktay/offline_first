import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:offline_first/core/services/navigation_service/i_navigation_service.dart';
import 'package:offline_first/core/services/navigation_service/navigation_service.dart';
import 'package:offline_first/core/services/network_service/i_network_service.dart';
import 'package:offline_first/core/services/network_service/network_service.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl
    // third-party
    ..registerLazySingleton<Dio>(Dio.new)

    // services
    ..registerLazySingleton<INavigationService>(NavigationService.new)
    ..registerLazySingleton<INetworkService>(() => NetworkService(sl()));
}
