class SellerSignupModel {
  bool? status;
  int? statusCode;
  String? token;
  Data? data;
  String? message;
  List<String>? error;

  SellerSignupModel(
      {this.status, this.statusCode, this.token, this.data, this.message, this.error});

  SellerSignupModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return SellerSignupModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return SellerSignupModel.withError(errorMsg);
  }

  SellerSignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  int? phone;
  int? zipcode;
  bool? status;
  int? id;

  Data({this.name, this.email, this.phone, this.zipcode, this.status, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
