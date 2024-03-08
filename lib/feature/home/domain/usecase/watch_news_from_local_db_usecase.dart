import 'package:offline_first/core/services/local_db_service/i_local_db_service.dart';
import 'package:offline_first/core/usecase/i_usecase.dart';
import 'package:offline_first/feature/home/domain/entity/article.dart';

class WatchNewsFromLocalDBUsecase
    implements Usecase<void, void Function(List<Article>)> {
  const WatchNewsFromLocalDBUsecase(this._localDBService);
  final ILocalDBService _localDBService;

  @override
  void call(void Function(List<Article>) callback) {
    return _localDBService.initWatcher<Article>(callback);
  }
}
