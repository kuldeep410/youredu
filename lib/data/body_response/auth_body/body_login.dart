/// email : "eve.holt@reqres.in"
/// password : "cityslicka"

class BodyLogin {
  BodyLogin({
    String? email,
    String? password,
    int? rememberMe,
  }) {
    _email = email;
    _password = password;
    _rememberMe = rememberMe;
  }

  BodyLogin.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _rememberMe = json['remember_me'];
  }

  String? _email;
  String? _password;
  int? _rememberMe;

  String? get email => _email;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['remember_me'] = _rememberMe;
    return map;
  }
}
