part of 'user_profile_bloc.dart';

abstract class UserProfileState {}
class UserProfileInitial extends UserProfileState {}
class UserProfileLoadedState extends UserProfileState{
  ProfileModel profileModel;
  UserProfileLoadedState({required this.profileModel});

}

class UserProfileLoadingState extends UserProfileState{}
class UserProfileErrorState extends UserProfileState{
  String errorMsg;
  UserProfileErrorState({required this.errorMsg});
}
