part of 'seller_signup_bloc.dart';

abstract class SellerSignupEvent extends Equatable {
  const SellerSignupEvent();
  @override
  List<Object> get props => [];
}

class SellerSignupSubmittedEvent extends SellerSignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String zipcode;
  final String password;
  final String confirmPassword;


  SellerSignupSubmittedEvent(this.firstName, this.lastName, this.email,
      this.phone, this.zipcode, this.password, this.confirmPassword);

  @override
  List<Object> get props => [firstName, lastName, phone, email, zipcode, password, confirmPassword];
}