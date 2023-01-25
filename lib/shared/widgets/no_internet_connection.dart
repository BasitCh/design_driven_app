// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        SvgPicture.asset(BlackBullIcons.icNoWifi,fit: BoxFit.contain,),
        33.verticalGap,
        StandardText.headline1(context, 'Device not connected',fontWeight: FontWeight.w800,fontSize: 22,color: BlackBullColors.white,),
       12.verticalGap,
        StandardText.headline1(context, 'Please make sure that you are connected to a data or wifi connection in order to use the BlackBull app',fontWeight: FontWeight.w600,fontSize: 16,color: BlackBullColors.white,align: TextAlign.center,)
      ],),
    );
  }
}
