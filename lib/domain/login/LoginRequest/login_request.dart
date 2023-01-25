// ignore_for_file: unnecessary_getters_setters

class LoginRequest {
  String? _token;
  String? _email;
  String? _password;
  String? _recaptcha;

  LoginRequest({
    String? token,
    String? email,
    String? password,
    String? recaptcha,
  }) {
    if (token != null) {
      _token = token;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (recaptcha != null) {
      _recaptcha = recaptcha;
    }
  }

  String? get token => _token;
  set token(String? token) => _token = token;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get recaptcha => _recaptcha;
  set recaptcha(String? recaptcha) => _recaptcha = recaptcha;

  LoginRequest.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _email = json['email'];
    _password = json['password'];
    _recaptcha = json['recaptcha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = _token;
    data['email'] = _email;
    data['password'] = _password;
    data['recaptcha'] = _recaptcha;
    return data;
  }
}
