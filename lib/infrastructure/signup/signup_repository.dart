import 'dart:async';
import 'package:black_bull_markets/domain/signup/i_singup_repository.dart';
import 'package:black_bull_markets/domain/signup/request/email_availability_request.dart';
import 'package:black_bull_markets/domain/signup/response/email_availability_response.dart';
import 'package:black_bull_markets/infrastructure/signup/signup_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class SignUpRepository implements ISignUpRepository {
  SignUpRepository({
    required this.contactApi,
  });
  final SignUpRemoteDataSource contactApi;

  // @override
  // Future<Either<FailureEntity, SignUpDataModel>> signUp({
  //   required SignupRequest contactRequest,
  // }) async {
  //   try {
  //     final SignUpDataModel response = await contactApi.signUp(contactRequest);
  //     return right(response);
  //   } on Exception {
  //     return left(const FailureEntity.serverFailure());
  //   }
  // }

  @override
  Future<Either<Exception, EmailAvailabilityResponse>> checkEmail({
    required EmailAvailabilityRequest emailAvailabilityRequest,
  }) async {
    try {
      final response = await contactApi.checkEmail(emailAvailabilityRequest);
      return right(response);
    } on DioError catch (e) {
      return left(
        Exception(e.response?.statusMessage ?? 'Email is already taken'),
      );
    }
  }
}
