part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileStateInitial extends EditProfileState {}

class EditProfileStateLoading extends EditProfileState {}

class EditProfileStateLoaded extends EditProfileState {
  final EditProfileResponseModel editProfileResponseModel;

  EditProfileStateLoaded(this.editProfileResponseModel);

  @override
  List<Object> get props => [editProfileResponseModel];
}

class EditProfileStateFailed extends EditProfileState {
  final String errorMessage;

  EditProfileStateFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
