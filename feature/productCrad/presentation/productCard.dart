import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely_seller/feature/dashboard_screen/bloc/home_view_bloc.dart';
import 'package:groomely_seller/widgets/custom_appbar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';
import '../../../../../feature/dashboard_screen/widgets/dashboard_item_widget.dart';
import '../../notification/presentation/notification.dart';

class ProductCradScreen extends StatefulWidget {
  @override
  State<ProductCradScreen> createState() => _ProductCradScreen();
}

class _ProductCradScreen extends State<ProductCradScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeViewBloc>(context).add(FetchHomeViewEvents());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(title: 'Products',)),
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text("Groomely",
        //       style: TextStyle(fontSize: 20, color: Colors.black)),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           // Navigator.pop(context);
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => NotificatonScreen()));
        //         },
        //         icon: Icon(
        //           Icons.notifications,
        //           color: Colors.black,
        //         )),
        //   ],
        // ),
        body: SingleChildScrollView(
          padding: getPadding(
            top: 7,
          ),
          child: BlocBuilder<HomeViewBloc, HomeViewState>(
            builder: (context, state) {
              if (state is HomeViewErrorState) {
                return Center(child: Text(state.errorMsg));
              } else if (state is HomeViewLoadingState) {
                return Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white.withOpacity(0.3),
                  child: Container(
                    color: const Color(0xFF244661),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              } else if (state is HomeViewLoadedState) {
                var active_services = state.homeViewModel.data!.activeServices;
                var todayBooking = "";
                return Column(
                  children: [
                    Container(
                       decoration: AppDecoration.fillGray200,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Container(
                              margin: getMargin(
                                top: 7,
                              ),
                              padding: getPadding(
                                left: 15,
                                top: 20,
                                right: 15,
                                bottom: 20,
                              ),
                              decoration: AppDecoration.fillWhiteA700,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Active Services",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterBold20,
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 2,
                                          bottom: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductCradScreen()));
                                              },
                                              child: Text(
                                                "more",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanMedium14,
                                              ),
                                            ),

                                            CustomImageView(
                                              svgPath: ImageConstant.imgVector,
                                              height: getVerticalSize(
                                                6,
                                              ),
                                              width: getHorizontalSize(
                                                3,
                                              ),
                                              margin: getMargin(
                                                left: 8,
                                                top: 6,
                                                bottom: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: getVerticalSize(
                                      240,
                                    ),
                                    child: ListView.separated(
                                      padding: getPadding(
                                        top: 21,
                                        bottom: 2,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (
                                        context,
                                        index,
                                      ) {
                                        return SizedBox(
                                          height: getVerticalSize(
                                            13,
                                          ),
                                        );
                                      },
                                      itemCount: state.homeViewModel.data!
                                          .activeServices!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: getMargin(
                                            left: 8,
                                          ),
                                          padding: getPadding(
                                            all: 15,
                                          ),
                                          decoration: AppDecoration.fillAmber100
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder6,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: getHorizontalSize(
                                                  120,
                                                ),
                                                margin: getMargin(
                                                  top: 1,
                                                ),
                                                child: Text(
                                                  "${state.homeViewModel.data?.activeServices![index].service?.additionalService?.name}"
                                                      .toUpperCase(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtInterBold12,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 16,
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath:
                                                          ImageConstant.imgStar,
                                                      height: getVerticalSize(
                                                        12,
                                                      ),
                                                      width: getHorizontalSize(
                                                        13,
                                                      ),
                                                      margin: getMargin(
                                                        top: 2,
                                                        bottom: 2,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 10,
                                                      ),
                                                      child: Text(
                                                        "4.84 (209.2K) ",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterLight14Black900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: getVerticalSize(
                                                  17,
                                                ),
                                                width: getHorizontalSize(
                                                  95,
                                                ),
                                                margin: getMargin(
                                                  top: 6,
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                      height: getSize(
                                                        20,
                                                      ),
                                                      width: getSize(
                                                        20,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "${state.homeViewModel.data?.activeServices![index].service?.duration}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterLight14Black900,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 4,
                                                ),
                                                child: Text(
                                                  "\$ " +
                                                      "${state.homeViewModel.data?.activeServices![index].rate}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtInterBold24,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 5,
                                                ),
                                                child: SizedBox(
                                                  width: getHorizontalSize(
                                                    150,
                                                  ),
                                                  child: Divider(
                                                    height: getVerticalSize(
                                                      1,
                                                    ),
                                                    thickness: getVerticalSize(
                                                      1,
                                                    ),
                                                    color:
                                                        ColorConstant.black900,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(
                                                        top: 3,
                                                        bottom: 6,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgCheckmark,
                                                            height:
                                                                getVerticalSize(
                                                              6,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              7,
                                                            ),
                                                          ),
                                                          CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorBlack900,
                                                            height:
                                                                getVerticalSize(
                                                              5,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              7,
                                                            ),
                                                            margin: getMargin(
                                                              top: 13,
                                                            ),
                                                          ),
                                                          CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorBlack900,
                                                            height:
                                                                getVerticalSize(
                                                              5,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              7,
                                                            ),
                                                            margin: getMargin(
                                                              top: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: getHorizontalSize(
                                                        113,
                                                      ),
                                                      margin: getMargin(
                                                        left: 11,
                                                      ),
                                                      child: Text(
                                                        "Men's Haircut\nBeard Shape & Style\n10 min Head Massage",
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterLight11,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: getMargin(
                        bottom: 95,
                      ),
                      padding: getPadding(
                        top: 20,
                        bottom: 20,
                      ),
                      decoration: AppDecoration.fillWhiteA700,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 13,
                              right: 13,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today’s Bookings",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterBold20,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                    bottom: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "more",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRobotoRomanMedium14,
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgVector,
                                        height: getVerticalSize(
                                          6,
                                        ),
                                        width: getHorizontalSize(
                                          3,
                                        ),
                                        margin: getMargin(
                                          left: 8,
                                          top: 6,
                                          bottom: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              280,
                            ),
                            child:
                                state.homeViewModel.data!.todaysBooking != null
                                    ? ListView.separated(
                                        padding: getPadding(
                                          left: 15,
                                          top: 21,
                                          bottom: 2,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (
                                          context,
                                          index,
                                        ) {
                                          return SizedBox(
                                            height: getVerticalSize(
                                              13,
                                            ),
                                          );
                                        },
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return DashboardItemWidget();
                                        },
                                      )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Text("No Booking")),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
