import 'dart:async';

import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.blueDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              BlackBullIcons.blackBullLogo,
              width: 220,
            ),
          ),
          350.verticalGap,
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: StandardText.headline1(
              context,
              'splash.loadingApp'.tr(),
              color: BlackBullColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: 200,
              // height: MediaQuery.of(context).size.height/90,
              decoration: BoxDecoration(
                border: Border.all(color: BlackBullColors.white, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: LinearProgressIndicator(
                backgroundColor: BlackBullColors.transparent,
                color: BlackBullColors.white,
                //minHeight: 15,
                value: value,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  void timer() {
    Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      setState(() {
        if (value >= 1) {
          timer.cancel();
          getIt<NavigationService>().navigateToNamed(
            beamerDelegate: globalBeamerDelegate,
            uri: NavigationService.loginRouteUri,
          );
        } else {
          value = value + 0.1;
        }
      });
    });
  }
}
