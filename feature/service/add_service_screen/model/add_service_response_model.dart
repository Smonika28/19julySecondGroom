class AddServiceResponseModel {
  bool? status;
  int? statusCode;
  String? message;

  AddServiceResponseModel({this.status, this.statusCode, this.message});

  AddServiceResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  AddServiceResponseModel.withError(String errorMsg){
    message = errorMsg;
  }
  insertToJson(Map<String, dynamic> json){
    return AddServiceResponseModel.fromJson(json);
  }
  insertToError(String errorMsg){
    return AddServiceResponseModel.withError(errorMsg);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}