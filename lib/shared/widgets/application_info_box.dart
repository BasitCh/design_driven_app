// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationInfoBox extends StatelessWidget {
  const ApplicationInfoBox({
    Key? key,
    required this.iconPath,
    required this.mainHeading,
    required this.backColor,
    required this.subHeading,
    required this.borderRadius,
  }) : super(key: key);

  final String iconPath;
  final StandardText mainHeading;
  final Color backColor;
  final double borderRadius;
  final StandardText subHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            45.verticalGap,
            SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
            35.verticalGap,
            mainHeading, 13.verticalGap, Expanded(child: subHeading),
          ],
        ),
      ),
    );
  }
}
