import 'package:offline_first/core/services/local_db_service/i_local_db_service.dart';
import 'package:offline_first/core/usecase/i_usecase.dart';
import 'package:offline_first/feature/home/domain/entity/article.dart';

class SaveNewsToLocalDBUsecase implements Usecase<void, List<Article>> {
  const SaveNewsToLocalDBUsecase(this._localDBService);
  final ILocalDBService _localDBService;

  @override
  Future<void> call(List<Article> list) async {
    return _localDBService.saveData<Article>(list);
  }
}
