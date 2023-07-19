import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely_seller/feature/booking/bloc/booking_history_bloc.dart';
import 'package:groomely_seller/feature/booking/widgets/booking_details_screen.dart';
import 'package:groomely_seller/presentation/signup_screen/signup_screen.dart';
import '../../../widgets/custom_appbar.dart';
import '../../notification/presentation/notification.dart';
import '../../signup/presentaion/signup_screen.dart';
import '../widgets/booking_history_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';

// ignore: must_be_immutable
class BookingHistoryScreen extends StatefulWidget {
  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  String? get status => null;
  String? pickedDate;

  Future<String> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));

    setState(
          () => pickedDate = picked.toString(),

    );
    return pickedDate!;
  }


  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookingHistoryBloc>(context)
        .add(FetchBookingHistoryListEvent());
  }

  List<dynamic> bookingHistoryData = [];

  @override
  Widget build(BuildContext context) {
    // var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(50),
        //     child: CustomAppBar(scaffoldKey: scaffoldKey)),
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Booking History",
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        body: Container(
          padding: getPadding(
            left: 15,
            top: 19,
            right: 15,
            bottom: 19,
          ),
          decoration: AppDecoration.fillWhiteA700,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 6,
                        bottom: 2,
                      ),
                      child: Text(
                        "Select booking date",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterLight12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                         String bookingDate = await _selectDate();
                         print("bookingDate---> ${bookingDate.toString()}");
                           setState(() {

                           });
                        await _selectDate();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingHistoryScreen(),
                          ),
                        );
                        // CustomTableCalender();
                      },
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCalculator,
                        height: getVerticalSize(
                          24,
                        ),
                        width: getHorizontalSize(
                          22,
                        ),
                        margin: getMargin(
                          left: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
                builder: (context, state) {
                  if (state is BookingHistoryLoadingState) {
                    return CircularProgressIndicator.adaptive();
                  } else if (state is BookingHistoryErrorState) {
                    return Center(child: Text(state.errorMsg));
                  } else if (state is BookingHistoryLoadedState) {
                    bookingHistoryData.addAll(state.bookingHistoryModel.data!);
                    print("bookingHistoryLength-----> ${bookingHistoryData.length}");

                    return Expanded(
                      child: Padding(
                        padding: getPadding(
                          top: 13,
                        ),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context,
                              index,) {
                            return SizedBox(
                              height: getVerticalSize(
                                7,
                              ),
                            );
                          },
                          itemCount: state.bookingHistoryModel.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingDetailsScreen(
                                                bookingHistoryData: state
                                                    .bookingHistoryModel
                                                    .data![index],
                                              )));
                                },
                                child: BookingHistoryItemWidget(
                                  bookingHistoryData:
                                  state.bookingHistoryModel.data![index],
                                ));
                          },
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}