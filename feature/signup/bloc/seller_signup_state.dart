part of 'seller_signup_bloc.dart';

abstract class SellerSignupState extends Equatable {
  const SellerSignupState();

  @override
  List<Object> get props => [];
}

class SellerSignupStateInitial extends SellerSignupState {}

class SellerSignupStateLoading extends SellerSignupState {}

class SellerSignupStateLoaded extends SellerSignupState {
  final SellerSignupModel sellerSignupModel;

  SellerSignupStateLoaded(this.sellerSignupModel);

  @override
  List<Object> get props => [sellerSignupModel];

}

class SellerSignupStateFailed extends SellerSignupState {
  final String errorMessage;

  SellerSignupStateFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

