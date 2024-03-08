import 'package:offline_first/feature/home/data/model/base_response.dart';

abstract class IHomeRepo {
  Future<BaseResponse> getNews();
}
