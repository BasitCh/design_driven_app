import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmittedPageArgs {
  SubmittedPageArgs({
    required this.continueText,
    required this.onContinue,
  });

  final String continueText;
  final Function() onContinue;
}

class SubmittedPage extends StatelessWidget {
  const SubmittedPage(
    this.args, {
    super.key,
  });

  final SubmittedPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.blueDark,
      appBar: AppBar(
        backgroundColor: BlackBullColors.blueDark,
        elevation: 0,
        centerTitle: true,
        title: StandardText.headline4(
          context,
          'Verification',
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: BlackBullColors.white,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: BlackBullColors.white,
          ),
          onPressed: () => getIt<NavigationService>()
              .navigateBack(beamerDelegate: globalBeamerDelegate),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                15.verticalGap,
                StandardText.headline4(
                  context,
                  'Account Registration',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: BlackBullColors.white,
                ),
                30.verticalGap,
                10.verticalGap,
                NumberStepper(
                  totalSteps: 2,
                  width: MediaQuery.of(context).size.width,
                  curStep: 2,
                  isLast: true,
                  stepCompleteColor: BlackBullColors.tertiary,
                  currentStepColor: BlackBullColors.accent,
                  inactiveColor: BlackBullColors.transparent,
                  lineWidth: 3.5,
                ),
                35.verticalGap,
                SvgPicture.asset(
                  BlackBullIcons.onBoardingSuccessIcon,
                  fit: BoxFit.contain,
                ),
                25.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: StandardText.headline4(
                    context,
                    'SUBMITTED',
                    align: TextAlign.left,
                    color: BlackBullColors.white,
                  ),
                ),
                25.verticalGap,
                StandardText.body2(
                  context,
                  'Thank you for applying for a live account with us. Our team is reviewing your application and we\'ll get back to you within 24 hours. Upon approval, you can commence trading.',
                  color: BlackBullColors.white,
                  align: TextAlign.center,
                  fontSize: 14,
                ),
                30.verticalGap,
                StandardText.body2(
                  context,
                  'While you wait, fund your live account now so you are ready to get started.',
                  color: BlackBullColors.white,
                  align: TextAlign.center,
                  fontSize: 14,
                ),
                30.verticalGap,
                AppButton(
                  text: args.continueText,
                  width: double.infinity,
                  color: BlackBullColors.white,
                  textColor: BlackBullColors.blueDark,
                  enableColor: BlackBullColors.blueDark,
                  borderColor: BlackBullColors.white,
                  radius: 8,
                  onPressed: args.onContinue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
