class ServiceFieldModel {
  Data? data;
  bool? status;
  String? message;
  ServiceFieldModel({this.data, this.status, this.message});
  ServiceFieldModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  ServiceFieldModel.withError(String errorMsg) {
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json) {
    return ServiceFieldModel.fromJson(json);
  }

  insertToError(String errorMsg) {
    return ServiceFieldModel.withError(errorMsg);
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
  String? duration;
  String? description;
  int? categoryId;
  int? serviceTypeId;
  int? offerId;
  Category? category;
  Category? serviceType;
  Offer? offer;

  Data(
      {this.id,
      this.duration,
      this.description,
      this.categoryId,
      this.serviceTypeId,
      this.offerId,
      this.category,
      this.serviceType,
      this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    description = json['description'];
    categoryId = json['category_id'];
    serviceTypeId = json['service_type_id'];
    offerId = json['offer_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    serviceType = json['service_type'] != null
        ? new Category.fromJson(json['service_type'])
        : null;
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['service_type_id'] = this.serviceTypeId;
    data['offer_id'] = this.offerId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.serviceType != null) {
      data['service_type'] = this.serviceType!.toJson();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
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
