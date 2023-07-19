part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfileSubmittedEvent extends EditProfileEvent {
  final String shopName;
  final String shopOwnerName;
  //final String email;
  final String phone;
  final String address;

  EditProfileSubmittedEvent(
      this.shopName, this.shopOwnerName, this.phone, this.address);

  @override
  List<Object> get props => [shopName, shopOwnerName, phone, address];
}
