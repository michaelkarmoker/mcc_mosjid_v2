class LoginRequestBody {
  List<LoginData>? loginData;

  LoginRequestBody({this.loginData});

  LoginRequestBody.fromJson(Map<String, dynamic> json) {
    if (json['login_data'] != null) {
      loginData = <LoginData>[];
      json['login_data'].forEach((v) {
        loginData!.add(new LoginData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginData != null) {
      data['login_data'] = this.loginData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginData {
  String? usersEmail;
  String? usersPassword;

  LoginData({this.usersEmail, this.usersPassword});

  LoginData.fromJson(Map<String, dynamic> json) {
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    return data;
  }
}