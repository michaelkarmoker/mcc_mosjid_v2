class LoginBody {
  String? password;


  LoginBody({ this.password,});

  LoginBody.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if(this.password!=null){
      data['password'] = this.password;
    }

    return data;
  }

  @override
  String toString() {
    return '{password: $password}';
  }
}