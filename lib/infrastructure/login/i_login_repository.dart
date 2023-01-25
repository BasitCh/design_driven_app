import 'package:black_bull_markets/domain/login/LoginRequest/login_request.dart';
import 'package:black_bull_markets/shared/network/utils/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'i_login_repository.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ILoginRepository {
  factory ILoginRepository(Dio dio, {String baseUrl}) = _ILoginRepository;
  @POST('/login')
  Future<Response> login({
    @Header('cookie') String? cookie,
    @Body() required LoginRequest loginRequest,
  });
}
