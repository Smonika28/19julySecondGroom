class HomeViewModel {
  Data? data;
  bool? status;
  String? message;
  HomeViewModel({this.data, this.status, this.message});
  HomeViewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  HomeViewModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return HomeViewModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return HomeViewModel.withError(errorMsg);
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
  SellerDetails? sellerDetails;
  List<ActiveServices>? activeServices;
  List<Null>? todaysBooking;

  Data({this.sellerDetails, this.activeServices, this.todaysBooking});

  Data.fromJson(Map<String, dynamic> json) {
    sellerDetails = json['seller_details'] != null
        ? new SellerDetails.fromJson(json['seller_details'])
        : null;
    if (json['active_services'] != null) {
      activeServices = <ActiveServices>[];
      json['active_services'].forEach((v) {
        activeServices!.add(new ActiveServices.fromJson(v));
      });
    }
    // if (json['todays_booking'] != null) {
    //   todaysBooking = <Null>[];
    //   json['todays_booking'].forEach((v) {
    //     todaysBooking!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sellerDetails != null) {
      data['seller_details'] = this.sellerDetails!.toJson();
    }
    if (this.activeServices != null) {
      data['active_services'] =
          this.activeServices!.map((v) => v.toJson()).toList();
    }
    // if (this.todaysBooking != null) {
    //   data['todays_booking'] =
    //       this.todaysBooking!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class SellerDetails {
  int? id;
  String? shopName;
  String? phone;
  String? zipcode;
  String? shopAddress;
  String? profilePicture;

  SellerDetails(
      {this.id,
      this.shopName,
      this.phone,
      this.zipcode,
      this.shopAddress,
      this.profilePicture});

  SellerDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    shopAddress = json['shop_address'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['shop_address'] = this.shopAddress;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}

class ActiveServices {
  int? id;
  int? serviceId;
  int? offerId;
  String? rate;
  int? status;
  Service? service;
  Offer? offer;

  ActiveServices(
      {this.id,
      this.serviceId,
      this.offerId,
      this.rate,
      this.status,
      this.service,
      this.offer});

  ActiveServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    offerId = json['offer_id'];
    rate = json['rate'];
    status = json['status'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['offer_id'] = this.offerId;
    data['rate'] = this.rate;
    data['status'] = this.status;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  int? additionalServiceId;
  String? duration;
  String? description;
  AdditionalService? additionalService;
  List<Review>? review;

  Service(
      {this.id,
      this.additionalServiceId,
      this.duration,
      this.description,
      this.additionalService,
      this.review});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    additionalServiceId = json['additional_service_id'];
    duration = json['duration'];
    description = json['description'];
    additionalService = json['additional_service'] != null
        ? new AdditionalService.fromJson(json['additional_service'])
        : null;
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['additional_service_id'] = this.additionalServiceId;
    data['duration'] = this.duration;
    data['description'] = this.description;
    if (this.additionalService != null) {
      data['additional_service'] = this.additionalService!.toJson();
    }
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdditionalService {
  int? id;
  String? name;

  AdditionalService({this.id, this.name});

  AdditionalService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Review {
  int? id;
  int? appointmentId;
  int? userId;
  int? serviceId;
  String? comment;
  String? rating;
  String? createdAt;
  String? updatedAt;

  Review(
      {this.id,
      this.appointmentId,
      this.userId,
      this.serviceId,
      this.comment,
      this.rating,
      this.createdAt,
      this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
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

class Offer {
  int? id;
  String? offerAmount;

  Offer({this.id, this.offerAmount});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerAmount = json['offer_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offer_amount'] = this.offerAmount;
    return data;
  }
}
