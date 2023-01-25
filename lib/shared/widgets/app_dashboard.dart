// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDashboard extends StatelessWidget {
  const AppDashboard({
    Key? key,
    required this.appName,

  }) : super(key: key);

  final String appName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: BlackBullColors.gridBox,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Stack(children: [
            Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(BlackBullIcons.icApplicationDash,fit: BoxFit.contain,),),
        Align(
            alignment: Alignment.center,
            child: StandardText.headline1(context,appName,color: BlackBullColors.black,fontSize: 16,fontWeight: FontWeight.w700,),)
      ],),
    );
  }
}
