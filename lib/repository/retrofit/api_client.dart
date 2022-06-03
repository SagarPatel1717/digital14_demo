import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../constant/string_constants.dart';
import '../../model/home_model.dart';
import '../data_source_manager/base_response.dart';
import 'api_base.dart';
import 'apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class ApiClient {

  factory ApiClient(Dio dio) {
    return _ApiClient(dio);
  }

  @GET(Apis.seatGeekEvents)
  Future<BaseResponse<List<HomeModel?>?>> seatGeekEventsList(
      @Query(clientId) String clientId,
      @Query(searchString) String searchString,
      @Query(page) String page,);
}
