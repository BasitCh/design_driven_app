import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/dotted_line.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InputBirthPage extends StatefulWidget {
  const InputBirthPage({super.key});

  @override
  State<InputBirthPage> createState() => _InputBirthPageState();
}

class _InputBirthPageState extends State<InputBirthPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.blueDark,
      appBar: AppBar(
        backgroundColor: BlackBullColors.blueDark,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => getIt<NavigationService>()
              .navigateBack(beamerDelegate: globalBeamerDelegate),
        ),
        title: StandardText.headline4(
          context,
          'Onboarding - Step1',
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: BlackBullColors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                40.verticalGap,
                StandardText.headline4(
                  context,
                  'Enter your \n Date of birth',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: BlackBullColors.white,
                ),
                30.verticalGap,
                StandardText.headline1(
                  color: BlackBullColors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  context,
                  'To create a live account you must be 18 or plus.Please enter your date of birth bellow. This information will be stored in your profile',
                ),
                60.verticalGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Expanded(
                      child: StandardTextField(
                        hintText: 'Month',
                        fillColor: BlackBullColors.white,
                      ),
                    ),
                    10.horizontalGap,
                    const Expanded(
                      child: StandardTextField(
                        hintText: 'Day',
                        fillColor: BlackBullColors.white,
                      ),
                    ),
                    10.horizontalGap,
                    const Expanded(
                      child: StandardTextField(
                        hintText: 'Year',
                        fillColor: BlackBullColors.white,
                      ),
                    )
                  ],
                ),
                30.verticalGap,
                AppButton(
                  text: 'Continue',
                  width: double.infinity,
                  color: BlackBullColors.tertiary,
                  textColor: BlackBullColors.white,
                  borderColor: BlackBullColors.tertiary,
                  radius: 8,
                  onPressed: () {
                    getIt<NavigationService>().navigateToNamed(
                      beamerDelegate: globalBeamerDelegate,
                      uri: NavigationService.inputEmailRouteUri,
                    );
                  },
                ),
                30.verticalGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: DottedLine(
                        direction: Axis.horizontal,
                        dashColor: BlackBullColors.white,
                        lineThickness: 1.0,
                        dashLength: 2.0,
                        dashRadius: 0.0,
                        dashGapLength: 1.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: StandardText.headline1(
                        context,
                        'login.or'.tr(),
                        fontSize: 12.0,
                        color: BlackBullColors.white,
                      ),
                    ),
                    const Expanded(
                      child: DottedLine(
                        direction: Axis.horizontal,
                        dashColor: BlackBullColors.white,
                        lineThickness: 1.0,
                        dashLength: 2.0,
                        dashRadius: 0.0,
                        dashGapLength: 1.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
                      ),
                    )
                  ],
                ),
                30.verticalGap,
                AppButton(
                  text: 'Create A Demo Account',
                  width: double.infinity,
                  color: BlackBullColors.white,
                  textColor: BlackBullColors.blueDark,
                  enableColor: BlackBullColors.blueDark,
                  borderColor: BlackBullColors.white,
                  radius: 8,
                  onPressed: () {
                    getIt<NavigationService>().navigateToNamed(
                      beamerDelegate: globalBeamerDelegate,
                      uri: NavigationService.inputEmailRouteUri,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
