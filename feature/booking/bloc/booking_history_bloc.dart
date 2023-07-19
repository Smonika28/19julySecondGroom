import 'package:bloc/bloc.dart';
import 'package:groomely_seller/feature/booking/model/booking_history.dart';
import 'package:groomely_seller/feature/booking/repo/booking_history_repo.dart';
import 'package:meta/meta.dart';

part 'booking_history_event.dart';
part 'booking_history_state.dart';

class BookingHistoryBloc
    extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  BookingHistoryBloc() : super(BookingHistoryInitial()) {
    BookingHistoryRepo bookingHistoryRepo = BookingHistoryRepo();
    on<FetchBookingHistoryListEvent>((event, emit) async {
      emit(BookingHistoryLoadingState());
      try {
        emit(BookingHistoryLoadingState());
        final myList = await bookingHistoryRepo.fetchBookingHistory();
        if (myList != null && myList.status == true) {
          emit(BookingHistoryLoadedState(bookingHistoryModel: myList));
        } else {
          emit(BookingHistoryErrorState(errorMsg: myList.message.toString()));
        }
      } on NetworkError {
        emit(BookingHistoryErrorState(errorMsg: "No Internet Connection"));
      }
    });
  }
}
