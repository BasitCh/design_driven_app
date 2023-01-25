import 'package:black_bull_markets/domain/signup/request/email_availability_request.dart';
import 'package:black_bull_markets/domain/signup/response/email_availability_response.dart';
import 'package:black_bull_markets/shared/network/utils/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'signup_remote_data_source.g.dart';

@RestApi(
  baseUrl: ApiConstant.baseUrl,
)
abstract class SignUpRemoteDataSource {
  factory SignUpRemoteDataSource(
    Dio dioBuilder,
  ) = _SignUpRemoteDataSource;

  // @POST('/jobprivatedata/create')
  // Future<SignUpDataModel> signUp(@Body() SignupRequest contactRequest);

  @POST('/register/email-availability')
  Future<EmailAvailabilityResponse> checkEmail(
    @Body() EmailAvailabilityRequest emailAvailabilityRequest,
  );
}
