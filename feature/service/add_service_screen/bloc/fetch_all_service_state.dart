part of 'fetch_all_service_bloc.dart';

abstract class FetchAllServiceState {}

class FetchAllServiceInitial extends FetchAllServiceState {}

class FetchAllServiceLoadingState extends FetchAllServiceState {}

class FetchAllServiceLoadedState extends FetchAllServiceState {
  AllServiceModel allServiceModel;
  ServiceFieldModel? serviceFieldModel;
  FetchAllServiceLoadedState(
      {required this.allServiceModel, this.serviceFieldModel});
}

class FetchAllServiceErrorState extends FetchAllServiceState {
  final String message;
  FetchAllServiceErrorState({required this.message});
}

/// Set Service field

abstract class FetchAllFieldState {}

class FetchAllFieldInitial extends FetchAllFieldState {}

class FetchAllServiceFieldLoading extends FetchAllFieldState {}

class FetchAllServiceDetailsFieldSetfaildState extends FetchAllFieldState {}

class FetchAllServiceDetailsFieldSetDoneState extends FetchAllFieldState {
  ServiceFieldModel detailServiceModel;
  FetchAllServiceDetailsFieldSetDoneState({required this.detailServiceModel});
}

class addServiceState extends FetchAllFieldState {
  final String message;
  addServiceState({required this.message});
}
