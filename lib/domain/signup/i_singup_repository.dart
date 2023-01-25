import 'package:black_bull_markets/domain/signup/request/email_availability_request.dart';
import 'package:black_bull_markets/domain/signup/response/email_availability_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class ISignUpRepository {
  // Future<Either<FailureEntity, SignUpDataModel>> signUp({
  //   required SignupRequest contactRequest,
  // });

  Future<Either<Exception, EmailAvailabilityResponse>> checkEmail({
    required EmailAvailabilityRequest emailAvailabilityRequest,
  });
}
