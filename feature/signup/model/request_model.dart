class SellerSignupRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? zipcode;
  String? password;
  String? confirmPassword;
  String? userType;

  SellerSignupRequestModel(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.zipcode,
        this.password,
        this.confirmPassword,
        this.userType});

  SellerSignupRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['user_type'] = this.userType;
    return data;
  }
}