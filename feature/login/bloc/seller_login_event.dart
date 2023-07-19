


part of 'seller_login_bloc.dart';

@immutable
abstract class SellerLoginEvent {}

// ignore: must_be_immutable
class SellerLoginEvents extends SellerLoginEvent{
  String userName;
  String password;
  String user_type;


  SellerLoginEvents({required this.userName, required this.password,
    required this.user_type,
 });
}