import 'package:offline_first/core/usecase/i_usecase.dart';
import 'package:offline_first/feature/home/domain/entity/article.dart';
import 'package:offline_first/feature/home/domain/repo/i_home_repo.dart';

class GetNewsFromNetworkUsecase implements Usecase<List<Article>, NoParams?> {
  const GetNewsFromNetworkUsecase(this._repo);
  final IHomeRepo _repo;

  @override
  Future<List<Article>> call(_) async {
    return _repo.getNews();
  }
}
