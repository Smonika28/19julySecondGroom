part of 'manage_service_bloc.dart';

abstract class ManageServiceState {}
class ManageServiceInitial extends ManageServiceState {}
class ManageServiceDataLoadingState extends ManageServiceState{

}
class ManageServiceDataLoadedState extends ManageServiceState{
 ServiceModel  serviceModel ;
  ManageServiceDataLoadedState({required this.serviceModel});
}

class ManageServiceDataErrorState extends ManageServiceState{
  String erromMsg ;
  ManageServiceDataErrorState({required this.erromMsg});
}