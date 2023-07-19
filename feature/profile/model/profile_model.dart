class ProfileModel {
  Data? data;
  bool? status;
  String? message;

  ProfileModel({this.data, this.status, this.message});
  ProfileModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return ProfileModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return ProfileModel.withError(errorMsg);
  }

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  Details? details;
  List<SellerRatingList>? sellerRatingList;
  Data({this.details, this.sellerRatingList});
  Data.fromJson(Map<String, dynamic> json) {
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    if (json['seller_rating_list'] != null) {
      sellerRatingList = <SellerRatingList>[];
      json['seller_rating_list'].forEach((v) {
        sellerRatingList!.add(new SellerRatingList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    if (this.sellerRatingList != null) {
      data['seller_rating_list'] =
          this.sellerRatingList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? zipcode;
  String? shopName;
  String? profilePicture;
  String? shopAddress;

  Details(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.zipcode,
      this.shopName,
      this.profilePicture,
      this.shopAddress});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    shopName = json['shop_name'];
    profilePicture = json['profile_picture'];
    shopAddress = json['shop_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['shop_name'] = this.shopName;
    data['profile_picture'] = this.profilePicture;
    data['shop_address'] = this.shopAddress;
    return data;
  }
}

class SellerRatingList {
  int? id;
  int? appointmentId;
  int? userId;
  int? serviceId;
  String? comment;
  String? rating;
  String? createdAt;
  String? updatedAt;

  SellerRatingList(
      {this.id,
      this.appointmentId,
      this.userId,
      this.serviceId,
      this.comment,
      this.rating,
      this.createdAt,
      this.updatedAt});

  SellerRatingList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_id'] = this.appointmentId;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
