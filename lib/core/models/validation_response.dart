class ValidationResponse {
  String? message;
  Errors? errors;

  ValidationResponse({this.message, this.errors});

  ValidationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? userName;
  List<String>? email;
  List<String>? password;
  List<String>? mobile;

  Errors({this.userName, this.email, this.password, this.mobile});

  Errors.fromJson(Map<String, dynamic> json) {
    // userName = json['username'].cast<List>();
    // email = json['email'].cast<List>();
    // password = json['password'].cast<List>();
    // password = json['mobile'].cast<List>();

    if (json['username'] != null) {
      userName = <String>[];
      json['username'].forEach((v) {
        userName!.add(v);
      });
    }
    if (json['email'] != null) {
      email = <String>[];
      json['email'].forEach((v) {
        email!.add(v);
      });
    }
    if (json['password'] != null) {
      password = <String>[];
      json['password'].forEach((v) {
        password!.add(v);
      });
    }
    if (json['mobile'] != null) {
      mobile = <String>[];
      json['mobile'].forEach((v) {
        mobile!.add(v);
      });
    }
  }

  Map<String, List<String>?> toJson() {
    final Map<String, List<String>?> data = <String, List<String>?>{};
    data['username'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    return data;
  }
}
