import 'package:offline_first/core/enums/request_methods.dart';
import 'package:offline_first/core/services/network_service/i_network_service.dart';
import 'package:offline_first/feature/home/core/constants/home_network_constants.dart';
import 'package:offline_first/feature/home/data/model/base_response.dart';
import 'package:offline_first/feature/home/domain/repo/i_home_repo.dart';

class HomeRepo implements IHomeRepo {
  const HomeRepo(this.networkService);
  final INetworkService networkService;

  @override
  Future<BaseResponse> getNews() async {
    try {
      final response = await networkService.networkRequest(
        HomeNetworkConstants.homeUrl,
        method: RequestMethods.get,
        headers: {},
      );

      return BaseResponse.fromJson(response as Map<String, dynamic>);
    } catch (_) {
      rethrow;
    }
  }
}
