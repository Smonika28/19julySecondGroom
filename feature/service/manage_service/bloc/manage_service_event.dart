part of 'manage_service_bloc.dart';

@immutable
abstract class ManageServiceEvent {}


class FetchServiceListEvent extends ManageServiceEvent{
    int? statusId;
    FetchServiceListEvent({required this.statusId});
}

