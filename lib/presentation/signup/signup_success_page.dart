// ignore_for_file: library_prefixes

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/bottom_sheets.dart';
import 'package:black_bull_markets/shared/widgets/custom_loading.dart';
import 'package:black_bull_markets/shared/widgets/info_box.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({super.key});

  @override
  State<SignUpSuccessPage> createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _step = 1;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      key: _scaffoldKey,
      backgroundColor: BlackBullColors.primary,
      bullPath: BlackBullImages.bullWhiteFull,
      appBar: AppBar(
        backgroundColor: BlackBullColors.primary,
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: BlackBullColors.black,
        //   ),
        //   onPressed: () => getIt<NavigationService>()
        //       .navigateBack(beamerDelegate: globalBeamerDelegate),
        // ),
        // leading: IconButton(
        //   onPressed: () {
        //     _scaffoldKey.currentState?.openDrawer();
        //   },
        //   icon: Image.asset(
        //     BlackBullImages.bullWhite,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        title: StandardText.headline4(
          context,
          'Onboarding - Step2',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              InfoBox(
                iconPath: BlackBullIcons.icTick,
                backColor: BlackBullColors.greenLight,
                borderRadius: 8.0,
                borderColor: BlackBullColors.darkGreen,
                mainHeading: StandardText.headline1(
                  context,
                  'signUp.success'.tr(),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: BlackBullColors.darkGreen,
                ),
                subHeading: StandardText.headline1(
                  context,
                  'signUp.successMessage'.tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: BlackBullColors.darkGreen,
                ),
              ),
              10.verticalGap,
              NumberStepper(
                totalSteps: 4,
                width: MediaQuery.of(context).size.width,
                curStep: 4,
                isLast: true,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.transparent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              60.verticalGap,
              StandardText.headline1(
                context,
                'signUp.personalDetails'.tr(),
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: BlackBullColors.black,
              ),
              11.verticalGap,
              StandardText.headline1(
                context,
                'signUp.getStartedText'.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: BlackBullColors.black,
              ),
              45.verticalGap,
              const CustomLoading(
                color: BlackBullColors.black,
                title: 'signUp.loading',
              ),
              2.verticalGap,
              GestureDetector(
                onTap: () => BottomSheets.turnOnNotification(context),
                child: StandardText.headline1(
                  context,
                  'signUp.soonRedirectText'.tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: BlackBullColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() {
      _step = step;
    });
  }

  continued() {
    _step < 3
        ? setState(() {
            _step += 1;
          })
        : null;
  }

  cancel() {
    _step > 1
        ? setState(() {
            _step -= 1;
          })
        : null;
  }
}
