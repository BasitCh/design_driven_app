import 'package:black_bull_markets/domain/login/LoginRequest/login_request.dart';
import 'package:black_bull_markets/domain/login/login_response/login_response.dart';
import 'package:black_bull_markets/infrastructure/login/i_login_repository.dart';
// ignore: implementation_imports
import 'package:dio/src/response.dart';

class LoginRepository {
  final ILoginRepository iLoginRepository;

  LoginRepository({
    required this.iLoginRepository,
  });

  Future<LoginResponse?> login(
      {String? cookie, required LoginRequest loginRequest,}) async {
    Response response;
    try {
      response = await iLoginRepository.login(loginRequest: loginRequest);
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      dynamic e = error as dynamic;
      if (e.response != null) {
        return LoginResponse.fromJson(e.response.data);
      } else {
        return null;
      }
    }
  }
}
