import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';
import 'package:groomely_seller/feature/service/add_service_screen/presentation/add_service_screen.dart';
import 'package:groomely_seller/presentation/edit_details_screen/edit_details_screen.dart';
import 'package:groomely_seller/widgets/custom_floating_button.dart';

import '../add_service_screen/presentation/edit_service_screen.dart';
import '../manage_service/model/service_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  Data? serviceData;

  ServiceDetailsScreen({required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
              elevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.black)),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Service Details",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            body: Container(
                padding: EdgeInsets.only(top: 10),
                height: getVerticalSize(807),
                width: double.maxFinite,
                decoration: AppDecoration.fillGray200,
                child: Column(children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: getPadding(left: 15, top: 17, right: 15),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: double.maxFinite,
                                    child: Container(
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
                                              Container(
                                                  width: double.maxFinite,
                                                  child: Container(
                                                      padding: getPadding(
                                                          left: 103,
                                                          top: 9,
                                                          right: 103,
                                                          bottom: 9),
                                                      decoration: AppDecoration
                                                          .fillOrangeA200
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder6),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 1),
                                                                child: Text(
                                                                    "Service name"
                                                                        .toUpperCase(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterBold12)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4),
                                                                child: Text(
                                                                    "${serviceData?.service?.additionalService?.name}",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterLight16))
                                                          ]))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 15),
                                                  child: Text(
                                                      "Category".toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 2),
                                                  child: Text(
                                                      "${serviceData?.service?.category?.name}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 20),
                                                  child: Text(
                                                      "service type"
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
                                                      "${serviceData?.service?.serviceType?.name}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 19),
                                                  child: Text(
                                                      "duration".toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 6),
                                                  child: Text(
                                                      "${serviceData?.service?.duration}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 16),
                                                  child: Text(
                                                      "rate".toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 6),
                                                  child: Text(
                                                      "${serviceData?.rate}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 16),
                                                  child: Text(
                                                      "offer".toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 6),
                                                  child: Text("15%",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight16)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 16),
                                                  child: Text(
                                                      "review".toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 9),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgStar,
                                                        height:
                                                            getVerticalSize(12),
                                                        width:
                                                            getHorizontalSize(
                                                                13),
                                                        margin: getMargin(
                                                            top: 1, bottom: 1)),
                                                    Padding(
                                                        padding:
                                                            getPadding(left: 6),
                                                        child: Text(
                                                            "4.84 (209.2K) ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtInterLight12))
                                                  ])),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26, top: 23),
                                                  child: Text(
                                                      "service Description"
                                                          .toUpperCase(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterBold12)),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      width: getHorizontalSize(
                                                          340),
                                                      margin: getMargin(
                                                          left: 26,
                                                          top: 9,
                                                          right: 17,
                                                          bottom: 30),
                                                      child: Text(
                                                          "${serviceData?.service?.description}",
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtInterLight12)))
                                            ]))),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomFloatingButton(
                                        backgroundColor:
                                            ColorConstant.lightBlue400,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      // serviceData: widget.serviceData,
                                                      EditServiceScreen()));
                                        },
                                        height: 71,
                                        width: 71,
                                        child: Icon(Icons.edit)),
                                    // SizedBox(width: 20),
                                    // CustomFloatingButton(
                                    //   backgroundColor: ColorConstant.redA200,
                                    //   onTap: () {
                                    //
                                    //   },
                                    //   height: 71,
                                    //   width: 71,
                                    //   child: Icon(Icons.delete)
                                    // ),
                                  ],
                                )
                              ])))
                ]))));
  }
}
