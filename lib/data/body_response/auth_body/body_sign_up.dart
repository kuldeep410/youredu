/// email : "email"
/// phone : 1
/// full_name : "full_name"
/// password : "12345678"
/// password_confirmation : "12345678"

class BodySignUp {
  BodySignUp({
    String? email,
    String? phone,
    String? fullName,
    String? password,
    String? passwordConfirmation,
  }) {
    _email = email;
    _phone = phone;
    _fullName = fullName;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  BodySignUp.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _fullName = json['name'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  String? _email;
  String? _phone;
  String? _fullName;
  String? _password;
  String? _passwordConfirmation;

  BodySignUp copyWith({
    String? email,
    String? phone,
    String? fullName,
    String? password,
    String? passwordConfirmation,
  }) =>
      BodySignUp(
        email: email ?? _email,
        phone: phone ?? _phone,
        fullName: fullName ?? _fullName,
        password: password ?? _password,
        passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
      );

  String? get email => _email;

  String? get phone => _phone;

  String? get fullName => _fullName;

  String? get password => _password;

  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['name'] = _fullName;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}
