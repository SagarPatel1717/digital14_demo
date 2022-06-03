import 'package:digital14_flutter_task/repository/data_source_manager/base_response.dart';
import 'package:digital14_flutter_task/repository/data_source_manager/response_wrapper.dart';
import 'package:digital14_flutter_task/repository/data_source_manager/server_error.dart';
import 'package:digital14_flutter_task/repository/retrofit/api_client.dart';

import '../model/home_model.dart';
import '../utils/shared_pref_utils.dart';

class HomeRepository {
  ApiClient apiClient;

  HomeRepository(this.apiClient);

  Future<ResponseWrapper<BaseResponse<List<HomeModel?>?>>> getEventsData(
      {required String page, String searchString = ''}) async {
    final clientId = SharedPrefUtils.getClientId() ?? '';
    try {
      var responseWrapper = ResponseWrapper<BaseResponse<List<HomeModel?>?>>();
      BaseResponse<List<HomeModel?>?> baseResponse =
          await apiClient.seatGeekEventsList(clientId, searchString, page);

      return responseWrapper..setData(baseResponse);
    } catch (e) {
      return ServerError.apiExceptionHandle<BaseResponse<List<HomeModel?>?>>(e);
    }
  }
}
