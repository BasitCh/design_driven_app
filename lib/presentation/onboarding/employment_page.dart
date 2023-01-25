import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/trading_preference_item.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/app_dropdown.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class EmploymentPage extends StatefulWidget {
  const EmploymentPage({super.key});

  @override
  State<EmploymentPage> createState() => _EmploymentPageState();
}

class _EmploymentPageState extends State<EmploymentPage> {
  List<String> industries = <String>[
    'Cash intensive businesses',
    'Defense industry',
    'Gaming and casino industry',
    'Money service businesses',
    'Charities/foundations',
    'Mining',
    'Oil and gas industries',
    'Finance',
    'Government',
    'Education',
    'Other'
  ];
  List<String> occupations = <String>[
    'Antique dealer',
    'Jeweller or precious metal dealer',
    'Betting clerk',
    'Dog or horse racing official',
    'Gaming worker',
    'Mining worker',
    'Auctioneer or pawn brokers',
    'Other'
  ];

  String _selectedIndustry = '', _selectedOccupation = '';

  @override
  void initState() {
    super.initState();
    _selectedIndustry = industries[0];
    _selectedOccupation = occupations[0];
  }

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
          'FOREX & CFDS - Application Step 3',
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
                curStep: 3,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'EMPLOYMENT',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: StandardText.body2(
                  context,
                  'Select your preferred options in order to complete your profile. You can choose one from each of the available options.',
                  align: TextAlign.left,
                ),
              ),
              30.verticalGap,
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: BlackBullColors.gradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalGap,
                      StandardText.headline5(
                        context,
                        'Industry & Occupation',
                        fontSize: 16,
                        align: TextAlign.start,
                        fontWeight: FontWeight.w800,
                      ),
                      25.verticalGap,
                      StandardText.body2(
                        context,
                        'Do you work in any of the following industries? Please select ” Others” if not.',
                      ),
                      15.verticalGap,
                      AppDropDown(
                        values: industries,
                        selectedValue: _selectedIndustry,
                        onChange: (String value) {
                          setState(() {
                            _selectedIndustry = value;
                          });
                        },
                      ),
                      15.verticalGap,
                      StandardText.body2(
                        context,
                        'Are you in any of the following occupations ? Please select ” Others” if not.',
                      ),
                      15.verticalGap,
                      AppDropDown(
                        values: occupations,
                        selectedValue: _selectedOccupation,
                        onChange: (String value) {
                          setState(() {
                            _selectedOccupation = value;
                          });
                        },
                      ),
                      35.verticalGap,
                    ],
                  ),
                ),
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'Why would you like to open an account?',
                values: <String>[
                  'Additional income',
                  'Personal interest ',
                  'Investment',
                  'Education',
                  'Institutional',
                  'Other'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'What is your estimated funding amount?',
                values: <String>[
                  '0 - 200',
                  '200 - 1k',
                  '1k - 5k',
                  '5k - 10k',
                  '10k - 20k',
                  '20k - 50k',
                  '50k - 100k',
                  '100k - 500k',
                  '500,000+'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'What is the source of your trading funds?',
                values: <String>[
                  'Salary',
                  'Self employment',
                  'Savings',
                  'Investment',
                  'Gift or Inheritance',
                  'Superannuation',
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title: 'What is your estimated net worth (in USD)?',
                values: <String>[
                  '50k - 100K',
                  '100k - 200K',
                  '200K - 500K',
                  '500K - 1mil',
                  '5mil+'
                ],
              ),
              10.verticalGap,
              const TradingPreferenceItem(
                title:
                    'What is your trading experience with Forex, Contracts for Difference, and Derivatives?',
                values: <String>[
                  'Beginner',
                  'Intermediate',
                  'Advanced',
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
                          uri: NavigationService.quizSuitabilityRouteUri,
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
