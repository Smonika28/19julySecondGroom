import 'package:flutter/material.dart';
import 'package:groomely_seller/core/app_export.dart';
import 'package:groomely_seller/widgets/custom_button.dart';

// ignore: must_be_immutable
class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: getMargin(
          right: 13,
        ),
        padding: getPadding(
          left: 15,
          top: 9,
          right: 15,
          bottom: 0,
        ),
        decoration: AppDecoration.fillGray200.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
              height: getVerticalSize(
                20,
              ),
              width: getHorizontalSize(
                155,
              ),
              text: "3:00 pm - 4:00 pm".toUpperCase(),
              shape: ButtonShape.CircleBorder11,
              padding: ButtonPadding.PaddingT3,
              fontStyle: ButtonFontStyle.InterMedium12,
              prefixWidget: Container(
                margin: getMargin(
                  right: 5,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgClockWhiteA700,
                ),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            Text(
              "Haircut + Beard + Massage".toUpperCase(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterBold14,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgClock,
                  height: getSize(
                    16,
                  ),
                  width: getSize(
                    16,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "1 hr 5 mins",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterLight14Black900,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "\$ 115",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterBold24,
            ),
            Padding(
              padding: getPadding(
                top: 4,
              ),
              child: SizedBox(
                width: getHorizontalSize(
                  218,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: ColorConstant.black900,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 16,
              ),
              child: Text(
                "Customer Information".toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterBold11.copyWith(
                  letterSpacing: getHorizontalSize(
                    2.26,
                  ),
                ),
              ),
            ),
            Container(
              width: getHorizontalSize(
                149,
              ),
              margin: getMargin(
                top: 5,
              ),
              child: Text(
                "Sudipa Ray\ntestuser@yopmail.com\n9089097898",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterLight14Black900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
