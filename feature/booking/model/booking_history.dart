class BookingHistoryModel {
  List<Data>? data;
  bool? status;
  String? message;

  BookingHistoryModel({this.data, this.status, this.message});

  BookingHistoryModel.withError(String errorMsg){
    message = errorMsg;
  }
    insertToJson(Map<String, dynamic> json){
    return BookingHistoryModel.fromJson(json);
  }
  insertToError(String errorMsg){
    return BookingHistoryModel.withError(errorMsg);
  }

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? serviceId;
  String? name;
  String? email;
  String? phone;
  String? bookingDate;
  int? bookingTimeId;
  String? amount;
  String? status;
  Service? service;

  Data(
      {this.id,
      this.userId,
      this.serviceId,
      this.name,
      this.email,
      this.phone,
      this.bookingDate,
      this.bookingTimeId,
      this.amount,
      this.status,
      this.service});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bookingDate = json['booking_date'];
    bookingTimeId = json['booking_time_id'];
    amount = json['amount'];
    status = json['status'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['booking_date'] = this.bookingDate;
    data['booking_time_id'] = this.bookingTimeId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  int? categoryId;
  int? serviceTypeId;
  int? additionalServiceId;
  String? duration;
  String? description;
  ServiceType? serviceType;
  Category? category;
  ServiceType? additionalService;
  List<Review>? review;

  Service(
      {this.id,
      this.categoryId,
      this.serviceTypeId,
      this.additionalServiceId,
      this.duration,
      this.description,
      this.serviceType,
      this.category,
      this.additionalService,
      this.review});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    serviceTypeId = json['service_type_id'];
    additionalServiceId = json['additional_service_id'];
    duration = json['duration'];
    description = json['description'];
    serviceType = json['service_type'] != null
        ? new ServiceType.fromJson(json['service_type'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    additionalService = json['additional_service'] != null
        ? new ServiceType.fromJson(json['additional_service'])
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
    data['category_id'] = this.categoryId;
    data['service_type_id'] = this.serviceTypeId;
    data['additional_service_id'] = this.additionalServiceId;
    data['duration'] = this.duration;
    data['description'] = this.description;
    if (this.serviceType != null) {
      data['service_type'] = this.serviceType!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.additionalService != null) {
      data['additional_service'] = this.additionalService!.toJson();
    }
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceType {
  int? id;
  String? name;

  ServiceType({this.id, this.name});

  ServiceType.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
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
