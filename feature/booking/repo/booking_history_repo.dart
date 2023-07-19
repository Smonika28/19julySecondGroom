import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/booking/model/booking_history.dart';
import 'package:groomely_seller/utils/APi/api_provider.dart';

class BookingHistoryRepo{
  final apiProvider = ApiProvider();
  BookingHistoryModel bookingHistoryModel = BookingHistoryModel();
  Future<dynamic> fetchBookingHistory(){
    return apiProvider.dataProcessor({},bookingHistoryModel, Apis.appointmentList);
  }
}
class NetworkError extends Error {}
