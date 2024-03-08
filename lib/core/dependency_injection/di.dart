import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// ignore: directives_ordering
import 'package:offline_first/core/services/local_db_service/i_local_db_service.dart';
import 'package:offline_first/core/services/local_db_service/local_db_service.dart';
import 'package:offline_first/core/services/navigation_service/i_navigation_service.dart';
import 'package:offline_first/core/services/navigation_service/navigation_service.dart';
import 'package:offline_first/core/services/network_service/i_network_service.dart';
import 'package:offline_first/core/services/network_service/network_service.dart';
import 'package:offline_first/feature/home/data/model/local/article_local_model.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl
    // third-party
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerSingletonAsync<Isar>(() async => _isarInit())

    // services
    ..registerLazySingleton<INavigationService>(NavigationService.new)
    ..registerFactory<ILocalDBService>(() => LocalDBService(sl()))
    ..registerLazySingleton<INetworkService>(() => NetworkService(sl()));
}

Future<Isar> _isarInit() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ArticleLocalModelSchema],
    directory: dir.path,
  );
  return isar;
}
