part of 'seller_login_bloc.dart';

abstract class SellerLoginState {}

class SellerLoginInitial extends SellerLoginState {}

class SellerLoginLodingState extends SellerLoginState{}

class SellerLoginLoadedState extends SellerLoginState{
  SellerLoginModel responseModel;
  SellerLoginLoadedState({required this.responseModel});
}

class SellerLoginErrorState extends SellerLoginState{
  String errorMsg;
  SellerLoginErrorState({required this.errorMsg});
}
