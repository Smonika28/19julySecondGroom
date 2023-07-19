class EditProfileResponseModel {
  Data? data;
  bool? status;
  String? message;

  EditProfileResponseModel({this.data, this.status, this.message});

  EditProfileResponseModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return EditProfileResponseModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return EditProfileResponseModel.withError(errorMsg);
  }

  EditProfileResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? shopName;
  String? email;
  String? phone;
  String? zipcode;
  String? shopAddress;
  dynamic emailVerifiedAt;
  String? profilePicture;
  dynamic socialType;
  int? status;
  int? loginStatus;
  dynamic googleId;
  dynamic facebookId;
  String? passwordUpdateTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data(
      {this.id,
        this.name,
        this.shopName,
        this.email,
        this.phone,
        this.zipcode,
        this.shopAddress,
        this.emailVerifiedAt,
        this.profilePicture,
        this.socialType,
        this.status,
        this.loginStatus,
        this.googleId,
        this.facebookId,
        this.passwordUpdateTime,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shopName = json['shop_name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    shopAddress = json['shop_address'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    socialType = json['social_type'];
    status = json['status'];
    loginStatus = json['login_status'];
    googleId = json['google_id'];
    facebookId = json['facebook_id'];
    passwordUpdateTime = json['password_update_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shop_name'] = this.shopName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['shop_address'] = this.shopAddress;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_picture'] = this.profilePicture;
    data['social_type'] = this.socialType;
    data['status'] = this.status;
    data['login_status'] = this.loginStatus;
    data['google_id'] = this.googleId;
    data['facebook_id'] = this.facebookId;
    data['password_update_time'] = this.passwordUpdateTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
