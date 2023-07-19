import 'package:flutter/material.dart';
// import 'package:groomely/src/utils/device_size_config.dart';

import '../../../../../theme/diviceHeight.dart';

class WelcomeSlideIndicator extends StatefulWidget {
  const WelcomeSlideIndicator({
    required this.deviceSizeConfig,
    required this.isActive,
  });

  final DeviceSizeConfig deviceSizeConfig;
  final bool isActive;

  @override
  State<WelcomeSlideIndicator> createState() => _WelcomeSlideIndicatorState();
}

class _WelcomeSlideIndicatorState extends State<WelcomeSlideIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.deviceSizeConfig.blockSizeVertical * 0.68,
      width: widget.isActive == true
          ? widget.deviceSizeConfig.blockSizeHorizontal * 5.0
          : widget.deviceSizeConfig.blockSizeHorizontal * 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5),
        // color: isActive == true
        //     ? Colors.deepOrange[600]
        //     : Colors.deepOrange[600]?.withOpacity(0.5),
        // color: isActive == true
        //     ? colorGoldenYellow
        //     : colorGoldenYellow.withOpacity(0.5),
        color: widget.isActive == true
            ? const Color(0XFFD5A353)
            : const Color(0XFFFFE7C1),
      ),
    );
  }
}
