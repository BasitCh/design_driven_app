// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.iconPath,
    required this.mainHeading,
    required this.backColor,
    required this.subHeading,
    required this.borderRadius,
    this.borderColor,
  }) : super(key: key);

  final String iconPath;
  final StandardText mainHeading;
  final Color backColor;
  final double borderRadius;
  final StandardText subHeading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(color:borderColor??BlackBullColors.transparent,width: borderColor==null?2:0),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            10.horizontalGap,
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[mainHeading, 5.verticalGap, subHeading],
              ),
            ),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                BlackBullIcons.icCloseInfo,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
