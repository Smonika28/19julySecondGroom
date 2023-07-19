import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../theme/diviceHeight.dart';

class WelcomeSlide extends StatelessWidget {
  const WelcomeSlide({
    required this.deviceSizeConfig,

    required this.imageUrl,
    required this.slideTitle,
    required this.slideText,
  });

  final DeviceSizeConfig deviceSizeConfig;
  final String imageUrl;
  final String slideTitle;
  final String slideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 0.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Image.asset(
              imageUrl,
              // height: deviceSizeConfig.blockSizeVertical * 42.0,
              width: double.infinity,
            ),
          ),
          // Center(
          //   child: SvgPicture.asset(
          //     imageUrl,
          //     width: double.infinity,
          //   ),
          // ),
          SizedBox(
            height: deviceSizeConfig.blockSizeVertical * 7.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 24.0,
            ),
            child: Text(slideTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 24.0,
                    letterSpacing: 1.0,
                    color:Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: Text(slideText,
                textAlign: TextAlign.center,
                // style: Theme.of(context).textTheme.bodyLarge,

                style: GoogleFonts.inter(
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }
}
