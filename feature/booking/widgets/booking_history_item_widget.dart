import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';
import 'package:groomely_seller/feature/booking/model/booking_history.dart';

// ignore: must_be_immutable
class BookingHistoryItemWidget extends StatelessWidget {
  Data bookingHistoryData;
  BookingHistoryItemWidget({required this.bookingHistoryData});

  String? get status => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: ColorConstant.gray200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Container(
        decoration: AppDecoration.txtFillLightblue400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
          color: _getCardColor(status: bookingHistoryData.status!),
        ),
        height: getVerticalSize(
          197,
        ),
        width: getHorizontalSize(
          384,
        ),
        padding: getPadding(
          left: 1,
          top: 6,
          right: 1,
          bottom: 6,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: getHorizontalSize(
                  91,
                ),
                margin: getMargin(
                  top: 16,
                ),
                padding: getPadding(
                  left: 11,
                  top: 2,
                  right: 11,
                  bottom: 2,
                ),
                decoration: AppDecoration.txtFillLightblue400.copyWith(
                  borderRadius: BorderRadiusStyle.txtCustomBorderTL28,
                  color: _getStatusColor(status: bookingHistoryData.status!),
                ),
                child: Text(
                  "${bookingHistoryData.status}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14WhiteA700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: getPadding(
                  left: 9,
                  top: 11,
                ),
                child: Text(
                  "Name".toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterBold12,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: getPadding(
                  left: 9,
                  top: 26,
                ),
                child: Text(
                  "${bookingHistoryData.name}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterLight16,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: getPadding(
                  left: 9,
                  right: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "status".toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold12,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 44,
                      ),
                      child: Text(
                        "Contact Details".toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold12,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Text(
                        "${bookingHistoryData.email}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterLight16,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 2,
                        right: 9,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${bookingHistoryData.phone}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterLight16,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 12,
                                ),
                                child: Text(
                                  "booking date".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterBold12,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 4,
                                ),
                                child: Text(
                                  //"fgdfgfgdf"
                                  "${bookingHistoryData.bookingDate}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterLight16,

                                  // if(bookingHistoryData.bookingDate== pickDate){
                                  //   print("hello date");
                                  // }
                                  // else{
                                  //   print("no date");
                                  // }
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: getPadding(
                              left: 21,
                              top: 32,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "booking time".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterBold12,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 4,
                                  ),
                                  child: Text(
                                    "${bookingHistoryData.bookingTimeId}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterLight16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 31,
                              top: 30,
                              bottom: 3,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterBold12,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 3,
                                  ),
                                  child: Text(
                                    "${bookingHistoryData.amount}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterLight16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor({required String status}) {
    // print('keyy->  $status');
    if (status == 'process') {
      return Colors.green;
    } else if (status == 'completed') {
      return Colors.blue;
    } else if (status == 'cancelled') {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Color _getCardColor({required String status}) {
    if (status == 'cancelled') {
      return Color(0xffFFE7C1);
      // return Colors.redAccent.shade100;
    } else {
      return Colors.grey.shade100;
    }
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:groomely_seller/core/app_export.dart';
// import 'package:groomely_seller/feature/booking/model/booking_history.dart';
//
// // ignore: must_be_immutable
// class BookingHistoryItemWidget extends StatelessWidget {
//   Data bookingHistoryData;
//   BookingHistoryItemWidget({required this.bookingHistoryData});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       elevation: 0,
//       margin: EdgeInsets.all(0),
//       color: ColorConstant.gray200,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadiusStyle.roundedBorder6,
//       ),
//       child: Container(
//         height: getVerticalSize(
//           197,
//         ),
//         width: getHorizontalSize(
//           384,
//         ),
//         padding: getPadding(
//           left: 1,
//           top: 6,
//           right: 1,
//           bottom: 6,
//         ),
//         decoration: AppDecoration.fillGray200.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder6,
//         ),
//         child: Stack(
//           alignment: Alignment.topLeft,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: getHorizontalSize(
//                   91,
//                 ),
//                 margin: getMargin(
//                   top: 16,
//                 ),
//                 padding: getPadding(
//                   left: 11,
//                   top: 2,
//                   right: 11,
//                   bottom: 2,
//                 ),
//                 decoration: AppDecoration.txtFillLightblue400.copyWith(
//                   borderRadius: BorderRadiusStyle.txtCustomBorderTL28,
//                 ),
//                 child: Text(
//                   "${bookingHistoryData.status}",
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppStyle.txtInterRegular14WhiteA700,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: getPadding(
//                   left: 9,
//                   top: 11,
//                 ),
//                 child: Text(
//                   "Name".toUpperCase(),
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppStyle.txtInterBold12,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: getPadding(
//                   left: 9,
//                   top: 26,
//                 ),
//                 child: Text(
//                   "${bookingHistoryData.name}",
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppStyle.txtInterLight16,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: getPadding(
//                   left: 9,
//                   right: 16,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "status".toUpperCase(),
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppStyle.txtInterBold12,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         top: 44,
//                       ),
//                       child: Text(
//                         "Contact Details".toUpperCase(),
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppStyle.txtInterBold12,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         top: 3,
//                       ),
//                       child: Text(
//                         "${bookingHistoryData.email}",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppStyle.txtInterLight16,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         top: 2,
//                         right: 9,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "${bookingHistoryData.phone}",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.txtInterLight16,
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   top: 12,
//                                 ),
//                                 child: Text(
//                                   "booking date".toUpperCase(),
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtInterBold12,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   top: 4,
//                                 ),
//                                 child: Text(
//                                   "${bookingHistoryData.bookingDate}",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtInterLight16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 21,
//                               top: 32,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "booking time".toUpperCase(),
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtInterBold12,
//                                 ),
//                                 Padding(
//                                   padding: getPadding(
//                                     top: 4,
//                                   ),
//                                   child: Text(
//                                     "${bookingHistoryData.bookingTimeId}",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtInterLight16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 31,
//                               top: 30,
//                               bottom: 3,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Amount".toUpperCase(),
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtInterBold12,
//                                 ),
//                                 Padding(
//                                   padding: getPadding(
//                                     top: 3,
//                                   ),
//                                   child: Text(
//                                     "${bookingHistoryData.amount}",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtInterLight16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
