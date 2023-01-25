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

class QuizSuitabilityPage extends StatefulWidget {
  const QuizSuitabilityPage({super.key});

  @override
  State<QuizSuitabilityPage> createState() => _QuizSuitabilityPageState();
}

class _QuizSuitabilityPageState extends State<QuizSuitabilityPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.primary,
      bullPath: BlackBullImages.bullWhiteFull,
      appBar: AppBar(
        backgroundColor: BlackBullColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: BlackBullColors.black,
          ),
          onPressed: () => getIt<NavigationService>()
              .navigateBack(beamerDelegate: globalBeamerDelegate),
        ),
        title: StandardText.headline4(
          context,
          'FOREX & CFDS - Application Step 4',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              15.verticalGap,
              StandardText.headline4(
                context,
                'FOREX & CFDS',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              10.verticalGap,
              NumberStepper(
                totalSteps: 4,
                width: MediaQuery.of(context).size.width,
                curStep: 4,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'Suitability Quiz',
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              20.verticalGap,
              StandardText.body2(
                context,
                'Important Notice',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                align: TextAlign.center,
              ),
              20.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: StandardText.body2(
                  context,
                  'We are required to conduct a suitability quiz with all new clients from New Zealand in order to assess their knowledge in the area of foreign exchange and derivatives trading. On the next page, you\'ll be presented with five multiple-choice questions. You\'ll need to answer at least four questions correctly in order to pass.',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  align: TextAlign.center,
                ),
              ),
              10.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: StandardText.body2(
                  context,
                  ' If you are not ready to proceed at this time, our Suitability Quiz FAQs can assist you in preparing.If your first attempt is unsuccessful, you can try again but after that, there is a cooling-off period before being able to retake the quiz.',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  align: TextAlign.center,
                ),
              ),
              30.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AppButton(
                  text: 'begin quiz',
                  width: double.infinity,
                  radius: 5,
                  textSize: 14,
                  onPressed: () {
                    getIt<NavigationService>().navigateToNamed(
                      uri: NavigationService.quizRouteUri,
                      beamerDelegate: globalBeamerDelegate,
                    );
                  },
                  borderColor: BlackBullColors.tertiary,
                  color: BlackBullColors.tertiary,
                  textColor: BlackBullColors.white,
                  enableColor: BlackBullColors.white,
                ),
              ),
              20.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}
