import 'package:offline_first/feature/home/domain/entity/article.dart';

abstract class IHomeRepo {
  Future<List<Article>> getNews();
}
