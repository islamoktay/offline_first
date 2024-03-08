import 'package:offline_first/core/services/local_db_service/i_local_db_service.dart';
import 'package:offline_first/core/usecase/i_usecase.dart';
import 'package:offline_first/feature/home/domain/entity/article.dart';

class GetNewsFromLocalDBUsecase implements Usecase<List<Article>, NoParams> {
  const GetNewsFromLocalDBUsecase(this._localDBService);
  final ILocalDBService _localDBService;

  @override
  Future<List<Article>> call(_) async {
    return _localDBService.getData<Article>();
  }
}
