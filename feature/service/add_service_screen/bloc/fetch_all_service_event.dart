part of 'fetch_all_service_bloc.dart';

abstract class FetchAllServiceEvent {}

class FetchAllServiceEvents extends FetchAllServiceEvent {}

abstract class FetchAllFieldEvent {}

class ServiceDetailsFieldEvent extends FetchAllFieldEvent {
  String serviceID;
  ServiceDetailsFieldEvent({required this.serviceID});
}

class AddServiceEvent extends FetchAllFieldEvent {
  int serviceID;
  String offerId;
  int offerPrice;

  AddServiceEvent(
      {required this.serviceID,
      required this.offerId,
      required this.offerPrice});
}
