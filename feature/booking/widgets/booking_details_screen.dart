// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:groomely_seller/core/app_export.dart';
// import 'package:groomely_seller/feature/booking/model/booking_history.dart';
// import 'package:groomely_seller/widgets/custom_button.dart';
// import 'package:groomely_seller/widgets/invoice/pdfexport/pdf_previcew.dart';
//
// class BookingDetailsScreen extends StatelessWidget {
//   bool isChecked = false;
//   Data bookingHistoryData;
//
//   BookingDetailsScreen({required this.bookingHistoryData});
//
//   // final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     Dialog(
//       child: Container(
//         height: 300,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FlutterLogo(
//               size: 150,
//             ),
//             Text(
//               "This is a Custom Dialog",
//               style: TextStyle(fontSize: 20),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Close"))
//           ],
//         ),
//       ),
//     );
//
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: ColorConstant.whiteA700,
//             appBar: AppBar(
//               leading: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back_ios, color: Colors.black)),
//               automaticallyImplyLeading: false,
//               backgroundColor: Colors.white,
//               centerTitle: true,
//               title: Text("Booking Details",
//                   style: TextStyle(fontSize: 20, color: Colors.black)),
//               actions: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.notifications,
//                       color: Colors.black,
//                     ))
//               ],
//             ),
//             body: SingleChildScrollView(
//                 padding: getPadding(top: 7),
//                 child: Stack(alignment: Alignment.topCenter, children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       padding: getPadding(
//                           left: 160, top: 156, right: 160, bottom: 156),
//                       decoration: AppDecoration.fillWhiteA700,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                               padding: getPadding(top: 743),
//                               child: Divider(
//                                   height: getVerticalSize(4),
//                                   thickness: getVerticalSize(4),
//                                   color: ColorConstant.gray9006c)),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.topCenter,
//                       child: Padding(
//                           padding: getPadding(left: 15, top: 14, right: 15),
//                           child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text("Booking Details".toUpperCase(),
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtInterBold16Black900),
//                                 Container(
//                                     width: double.maxFinite,
//                                     child: Container(
//                                         width: getHorizontalSize(384),
//                                         margin: getMargin(top: 13),
//                                         decoration: AppDecoration.fillGray200
//                                             .copyWith(
//                                                 borderRadius: BorderRadiusStyle
//                                                     .roundedBorder6),
//                                         child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: GestureDetector(
//                                                     onTap: () {
//                                                       print("chp testing");
//                                                     },
//                                                     child: Container(
//                                                       width:
//                                                           getHorizontalSize(91),
//                                                       padding: getPadding(
//                                                           left: 11,
//                                                           top: 2,
//                                                           right: 11,
//                                                           bottom: 2),
//                                                       decoration: AppDecoration
//                                                           .txtFillLightblue400
//                                                           .copyWith(
//                                                               borderRadius:
//                                                                   BorderRadiusStyle
//                                                                       .txtCustomBorderTL28),
//                                                       child: PopupMenuButton(
//                                                         child: Text(
//                                                             "${bookingHistoryData.status}",
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             textAlign:
//                                                                 TextAlign.left,
//                                                             style: AppStyle
//                                                                 .txtInterRegular14WhiteA700),
//                                                         itemBuilder: (context) {
//                                                           return List.generate(
//                                                               1, (index) {
//                                                             return PopupMenuItem(
//                                                                 child:
//                                                                     Container(
//                                                               width: 250,
//                                                               decoration: BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               50)),
//                                                               child: Column(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .start,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                           "Status"),
//                                                                       IconButton(onPressed: (){}, icon: Icon(Icons.close)),
//                                                                     ],
//                                                                   ),
//
//
//                                                                   Row(
//                                                                     children: [
//                                                                       Checkbox.adaptive(
//                                                                           value:
//                                                                               false,
//                                                                           onChanged:
//                                                                               (v) {}
//                                                                       ),
//                                                                       Text(
//                                                                           "Pending"),
//                                                                     ],
//                                                                   ),
//                                                                   Row(
//                                                                     children: [
//                                                                       Checkbox.adaptive(
//                                                                           value:
//                                                                               false,
//                                                                           onChanged:
//                                                                               (v) {}),
//                                                                       Text(
//                                                                           "Completed"),
//                                                                     ],
//                                                                   ),
//                                                                   Row(
//                                                                     children: [
//                                                                       // Checkbox(
//                                                                       //     value:
//                                                                       //         true,
//                                                                       //     onChanged:
//                                                                       //         (v) {}),
//
//
//                                                                       Checkbox.adaptive(
//                                                                           value:
//                                                                           false,
//                                                                           onChanged:
//                                                                               (v) {}
//                                                                       ),
//                                                                       Text(
//                                                                           "Progress"),
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ));
//                                                           });
//                                                         },
//                                                       ),
//                                                     ),
//                                                   )),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 6),
//                                                   child: Text(
//                                                       "customer nAME"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 2),
//                                                   child: Text(
//                                                       "${bookingHistoryData.name}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 23),
//                                                   child: Text(
//                                                       "Contact details"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 3),
//                                                   child: Text(
//                                                       "${bookingHistoryData.email}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 4),
//                                                   child: Text(
//                                                       "${bookingHistoryData.phone}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 23),
//                                                   child: Text(
//                                                       "booking date"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 3),
//                                                   child: Text(
//                                                       "${bookingHistoryData.bookingDate}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 22),
//                                                   child: Text(
//                                                       "booking time"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 10),
//                                                   child: Text(
//                                                       "${bookingHistoryData.bookingTimeId}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26, top: 22),
//                                                   child: Text(
//                                                       "Amount".toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       left: 26,
//                                                       top: 9,
//                                                       bottom: 20),
//                                                   child: Text(
//                                                       "${bookingHistoryData.amount}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16))
//                                             ]))),
//                                 Padding(
//                                     padding: getPadding(top: 14),
//                                     child: Text("Service Details".toUpperCase(),
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style:
//                                             AppStyle.txtInterBold16Black900)),
//                                 Container(
//                                     width: double.maxFinite,
//                                     child: Container(
//                                         width: getHorizontalSize(384),
//                                         margin: getMargin(top: 13),
//                                         padding: getPadding(
//                                             left: 26,
//                                             top: 24,
//                                             right: 26,
//                                             bottom: 24),
//                                         decoration: AppDecoration.fillGray200
//                                             .copyWith(
//                                                 borderRadius: BorderRadiusStyle
//                                                     .roundedBorder6),
//                                         child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             children: [
//                                               Padding(
//                                                   padding: getPadding(top: 5),
//                                                   child: Text(
//                                                       "Service Name"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12Black900)),
//                                               Padding(
//                                                   padding: getPadding(top: 2),
//                                                   child: Text(
//                                                       "${bookingHistoryData.service?.additionalService?.name}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(top: 11),
//                                                   child: Text(
//                                                       "Service Category"
//                                                           .toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12Black900)),
//                                               Padding(
//                                                   padding: getPadding(top: 2),
//                                                   child: Text(
//                                                       "${bookingHistoryData.service?.category?.name}",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(top: 11),
//                                                   child: Text(
//                                                       "Duration".toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                 padding: getPadding(top: 2),
//                                                 child: Text(
//                                                     "${bookingHistoryData.service?.duration}",
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     style: AppStyle
//                                                         .txtInterLight16),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(top: 11),
//                                                 child: Text(
//                                                     "rate".toUpperCase(),
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     style: AppStyle
//                                                         .txtInterBold12),
//                                               ),
//                                               Padding(
//                                                   padding: getPadding(top: 9),
//                                                   child: Text("390",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16)),
//                                               Padding(
//                                                   padding: getPadding(top: 11),
//                                                   child: Text(
//                                                       "offer".toUpperCase(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterBold12)),
//                                               Padding(
//                                                   padding: getPadding(top: 9),
//                                                   child: Text("50%",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtInterLight16))
//                                             ]))),
//                                 CustomButton(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   PdfPreviewPage()));
//                                     },
//                                     height: getVerticalSize(55),
//                                     text: "SEND INVOICE",
//                                     margin:
//                                         getMargin(left: 45, top: 48, right: 46))
//                               ])))
//                 ]))));
//   }
//
//   onTapArrowleft3(BuildContext context) {
//     Navigator.pop(context);
//   }
// }
//
//
//
// // Container(
// // padding: EdgeInsets.all(10),
// // child: Checkbox(
// // value: _isChecked,
// // onChanged: (value) {
// // setState(() {
// // _isChecked = value!;
// // });
// // },
// // )
// // )





//stateful widget


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';
import 'package:groomely_seller/feature/booking/model/booking_history.dart';
import 'package:groomely_seller/widgets/custom_button.dart';
import 'package:groomely_seller/widgets/invoice/pdfexport/pdf_previcew.dart';

class BookingDetailsScreen extends StatefulWidget {
  Data bookingHistoryData;

  BookingDetailsScreen({required this.bookingHistoryData});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  bool _isCheckedPending= false;
  bool _isCheckedCompleted= false;
  bool _isCheckedProgress= false;
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Dialog(
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Text(
              "This is a Custom Dialog",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"))
          ],
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.black)),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Booking Details",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              // actions: [
              //   IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.notifications,
              //         color: Colors.black,
              //       ))
              // ],
            ),
            body: SingleChildScrollView(
                padding: getPadding(top: 7),
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: getPadding(
                          left: 160, top: 156, right: 160, bottom: 156),
                      decoration: AppDecoration.fillWhiteA700,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: getPadding(top: 743),
                              child: Divider(
                                  height: getVerticalSize(4),
                                  thickness: getVerticalSize(4),
                                  color: ColorConstant.gray9006c)),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: getPadding(left: 15, top: 14, right: 15),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Booking Details".toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterBold16Black900),
                                Container(
                                    width: double.maxFinite,
                                    child: Container(
                                        width: getHorizontalSize(384),
                                        margin: getMargin(top: 13),
                                        decoration: AppDecoration.fillGray200
                                            .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder6),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment:
                                                  Alignment.centerRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print("chp testing");
                                                    },
                                                    child: Container(
                                                      width:
                                                      getHorizontalSize(91),
                                                      padding: getPadding(
                                                          left: 11,
                                                          top: 2,
                                                          right: 11,
                                                          bottom: 2),
                                                      decoration: AppDecoration
                                                          .txtFillLightblue400
                                                          .copyWith(
                                                          borderRadius:
                                                          BorderRadiusStyle
                                                              .txtCustomBorderTL28),
                                                      child: PopupMenuButton(
                                                        child: Text(
                                                            "${widget.bookingHistoryData.status}",
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: AppStyle
                                                                .txtInterRegular14WhiteA700),
                                                        itemBuilder: (context) {
                                                          return List.generate(
                                                              1, (index) {
                                                            return PopupMenuItem(
                                                                child:
                                                                Container(
                                                                  width: 250,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          50)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                              "Status"),
                                                                          IconButton(
                                                                              onPressed:
                                                                                  () {},
                                                                              icon:
                                                                              Icon(Icons.close)),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Checkbox
                                                                              .adaptive(
                                                                            value:
                                                                            _isCheckedPending,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(
                                                                                      () {
                                                                                        _isCheckedPending =
                                                                                    value!;
                                                                                  });
                                                                            },
                                                                          ),
                                                                          // Checkbox.adaptive(
                                                                          //     value:
                                                                          //         false,
                                                                          //     onChanged:
                                                                          //         (v) {}
                                                                          // ),
                                                                          Text(
                                                                              "Pending"),
                                                                        ],
                                                                      ),
                                                                      Row(

                                                                        children: [
                                                                          Checkbox
                                                                              .adaptive(
                                                                            value:
                                                                            _isCheckedCompleted,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(
                                                                                      () {
                                                                                        _isCheckedCompleted =
                                                                                    value!;
                                                                                  });
                                                                            },
                                                                          ),
                                                                          Text(
                                                                              "Completed"),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          // Checkbox(
                                                                          //     value:
                                                                          //         true,
                                                                          //     onChanged:
                                                                          //         (v) {}),

                                                                          Checkbox
                                                                              .adaptive(
                                                                            value:
                                                                            _isCheckedProgress,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(
                                                                                      () {
                                                                                    _isCheckedProgress =
                                                                                    value!;
                                                                                  });
                                                                            },
                                                                          ),
                                                                          Text(
                                                                              "Progress"),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 6),
                                                  child: Text(
                                                      "customer nAME"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 2),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.name}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 23),
                                                  child: Text(
                                                      "Contact details"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 3),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.email}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 4),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.phone}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 23),
                                                  child: Text(
                                                      "booking date"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 3),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.bookingDate}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 22),
                                                  child: Text(
                                                      "booking time"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 10),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.bookingTimeId}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 22),
                                                  child: Text(
                                                      "Amount".toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26,
                                                      top: 9,
                                                      bottom: 20),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.amount}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16))
                                            ]))),
                                Padding(
                                    padding: getPadding(top: 14),
                                    child: Text("Service Details".toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                        AppStyle.txtInterBold16Black900)),
                                Container(
                                    width: double.maxFinite,
                                    child: Container(
                                        width: getHorizontalSize(384),
                                        margin: getMargin(top: 13),
                                        padding: getPadding(
                                            left: 26,
                                            top: 24,
                                            right: 26,
                                            bottom: 24),
                                        decoration: AppDecoration.fillGray200
                                            .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder6),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Text(
                                                      "Service Name"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12Black900)),
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.service?.additionalService?.name}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(top: 11),
                                                  child: Text(
                                                      "Service Category"
                                                          .toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12Black900)),
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text(
                                                      "${widget.bookingHistoryData.service?.category?.name}",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(top: 11),
                                                  child: Text(
                                                      "Duration".toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                padding: getPadding(top: 2),
                                                child: Text(
                                                    "${widget.bookingHistoryData.service?.duration}",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterLight16),
                                              ),
                                              Padding(
                                                padding: getPadding(top: 11),
                                                child: Text(
                                                    "rate".toUpperCase(),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterBold12),
                                              ),
                                              Padding(
                                                  padding: getPadding(top: 9),
                                                  child: Text("390",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(top: 11),
                                                  child: Text(
                                                      "offer".toUpperCase(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(top: 9),
                                                  child: Text("50%",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16))
                                            ]))),
                                CustomButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PdfPreviewPage()));
                                    },
                                    height: getVerticalSize(55),
                                    text: "SEND INVOICE",
                                    margin:
                                    getMargin(left: 45, top: 48, right: 46))
                              ])))
                ]))));
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}



