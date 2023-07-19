part of 'booking_history_bloc.dart';

abstract class BookingHistoryState {}

class BookingHistoryInitial extends BookingHistoryState {}

class BookingHistoryLoadingState extends BookingHistoryState{}

class BookingHistoryLoadedState extends BookingHistoryState{
  BookingHistoryModel bookingHistoryModel ; 
  BookingHistoryLoadedState({required this.bookingHistoryModel});
}

class BookingHistoryErrorState extends BookingHistoryState{
  String errorMsg;
  BookingHistoryErrorState({required this.errorMsg});
}
