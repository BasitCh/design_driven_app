import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/trading_preference_item.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class TradingPreferencesPage extends StatefulWidget {
  const TradingPreferencesPage({super.key});

  @override
  State<TradingPreferencesPage> createState() => _TradingPreferencesPageState();
}

class _TradingPreferencesPageState extends State<TradingPreferencesPage> {
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
          'FOREX & CFDS - Application Step 2',
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
                curStep: 2,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'TRADING PREFERENCES',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: StandardText.body2(
                  context,
                  'Select the trading preferences in order to complete your profile. You can choose one from each of the available options.',
                  align: TextAlign.center,
                ),
              ),
              30.verticalGap,
              const TradingPreferenceItem(
                title: 'Trading Account Type',
                values: <String>[
                  'Standard',
                  'Prime',
                  'Islamic Standard',
                  'Islamic Prime',
                  'Institutional'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'Trading Account Currency',
                values: <String>[
                  'USD',
                  'EUR',
                  'GBP',
                  'AUD',
                  'NZD',
                  'SGD',
                  'CAD',
                  'JPY'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'Trading Account Leverage',
                values: <String>[
                  '1',
                  '33',
                  '55',
                  '100',
                  '200',
                  '300',
                  '400',
                  '500'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'Trading Account Platform',
                values: <String>[
                  'METATRADER 4',
                  'METATRADER 5',
                  'TRADINGVIEW',
                ],
              ),
              20.verticalGap,
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppButton(
                      text: 'previous',
                      radius: 5,
                      textSize: 14,
                      onPressed: () => getIt<NavigationService>()
                          .navigateBack(beamerDelegate: globalBeamerDelegate),
                      borderColor: BlackBullColors.darkGrey,
                      color: BlackBullColors.darkGrey,
                      textColor: BlackBullColors.white,
                    ),
                  ),
                  15.horizontalGap,
                  Expanded(
                    child: AppButton(
                      text: 'submit ',
                      radius: 5,
                      textSize: 14,
                      onPressed: () {
                        getIt<NavigationService>().navigateToNamed(
                          uri: NavigationService.employmentRouteUri,
                          beamerDelegate: globalBeamerDelegate,
                        );
                      },
                      borderColor: BlackBullColors.tertiary,
                      color: BlackBullColors.tertiary,
                      textColor: BlackBullColors.white,
                    ),
                  ),
                ],
              ),
              20.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}
