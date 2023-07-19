class SellerLoginModel {
  bool? status;
  int? statusCode;
  Data? data;
  String? message;

  SellerLoginModel({this.status, this.statusCode, this.data, this.message});

  SellerLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  SellerLoginModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return SellerLoginModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return SellerLoginModel.withError(errorMsg);
  }
}

class Data {
  String? authToken;
  User? user;

  Data({this.authToken, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? zipcode;
  int? status;
  String? profilePicture;
  String? shopAddress;
  String? shopName;
  String? userType;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.zipcode,
      this.status,
      this.profilePicture,
      this.shopAddress,
      this.shopName,
      this.userType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    status = json['status'];
    profilePicture = json['profile_picture'];
    shopAddress = json['shop_address'];
    shopName = json['shop_name'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['status'] = this.status;
    data['profile_picture'] = this.profilePicture;
    data['shop_address'] = this.shopAddress;
    data['shop_name'] = this.shopName;
    data['user_type'] = this.userType;
    return data;
  }
}
