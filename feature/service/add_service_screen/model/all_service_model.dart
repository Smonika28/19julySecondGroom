class AllServiceModel {
  bool? status;
  int? statusCode;
  List<Data>? data;
  String? message;
  AllServiceModel({this.status, this.statusCode, this.data, this.message});

  
  AllServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
    AllServiceModel.withError(String errorMsg){
    message = errorMsg;
  }
    insertToJson(Map<String, dynamic> json){
    return AllServiceModel.fromJson(json);
  }
  insertToError(String errorMsg){
    return AllServiceModel.withError(errorMsg);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? additionalServiceId;
  AdditionalService? additionalService;



  Data({this.id, this.additionalServiceId, this.additionalService});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    additionalServiceId = json['additional_service_id'];
    additionalService = json['additional_service'] != null
        ? new AdditionalService.fromJson(json['additional_service'])
        : null;
  }

  get service => null;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['additional_service_id'] = this.additionalServiceId;
    if (this.additionalService != null) {
      data['additional_service'] = this.additionalService!.toJson();
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
