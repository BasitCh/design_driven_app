// ignore_for_file: library_prefixes

import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/app_dropdown.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_stepper.dart'
    as BSTEPPER;
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  int _step = 1;
  List<String> accountTypes = <String>[
    'Standard',
    'Prime',
    'Islamic Standard',
    'Islamic Prime',
    'Institutional'
  ];
  String _selectedAccountType = '';
  Country? _selectedCountry;

  @override
  void initState() {
    initCountry();
    super.initState();
    _selectedAccountType = accountTypes[0];
  }

  void initCountry() async {
    final List<Country> countries = await getCountries(context);
    final Country country = countries
        .where((Country country) => country.callingCode == '+64')
        .first;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (mounted) {
        setState(() {
          _selectedCountry = country;
        });
      }
    });
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
          'FOREX & CFDS - Application Step 1',
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
                curStep: 1,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'PERSONAL DETAILS',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: StandardText.body2(
                  context,
                  'Enter your address, state, city & zipcode',
                  maxLines: 2,
                  align: TextAlign.center,
                ),
              ),
              30.verticalGap,
              BSTEPPER.CustomStepper(
                physics: const ScrollPhysics(),
                currentStep: _step - 1,
                onStepTapped: (int step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                controlsBuilder: (
                  BuildContext context,
                  _,
                ) {
                  return const SizedBox.shrink();
                },
                steps: <BSTEPPER.Step>[
                  BSTEPPER.Step(
                    title: StandardText.headline4(
                      context,
                      'Name & Email:',
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        AppDropDown(
                          values: accountTypes,
                          selectedValue: _selectedAccountType,
                          hintText: 'Account Type',
                          onChange: (String accountType) {
                            setState(() {
                              _selectedAccountType = accountType;
                            });
                          },
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'First Name',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'Middle Name (Optional)',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'Last Name',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        AppButton(
                          text: 'Next',
                          width: 100,
                          height: 30,
                          radius: 5,
                          textSize: 14,
                          onPressed: continued,
                          color: BlackBullColors.black,
                          textColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                      ],
                    ),
                    isActive: _step >= 0,
                    state: _step >= 0
                        ? BSTEPPER.StepState.complete
                        : BSTEPPER.StepState.disabled,
                  ),
                  BSTEPPER.Step(
                    title: StandardText.headline4(
                      context,
                      'Address',
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        const StandardTextField(
                          hintText: 'Address',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'State',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'City',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'Zipcode',
                          fillColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                        AppButton(
                          text: 'Next',
                          width: 100,
                          height: 30,
                          radius: 5,
                          textSize: 14,
                          onPressed: continued,
                          color: BlackBullColors.black,
                          textColor: BlackBullColors.white,
                        ),
                        8.verticalGap,
                      ],
                    ),
                    isActive: _step >= 0,
                    state: _step >= 2
                        ? BSTEPPER.StepState.complete
                        : BSTEPPER.StepState.disabled,
                  ),
                  BSTEPPER.Step(
                    title: StandardText.headline4(
                      context,
                      'Phone & Country::',
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () => _onPressedShowBottomSheet(context),
                              child: Container(
                                width: 60,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: BlackBullColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: _selectedCountry == null
                                    ? Container()
                                    : Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Image.asset(
                                              _selectedCountry!.flag,
                                              package: countryCodePackageName,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: BlackBullColors.black,
                                            size: 14,
                                          )
                                        ],
                                      ),
                              ),
                            ),
                            5.horizontalGap,
                            const Expanded(
                              child: StandardTextField(
                                hintText: '+852 23937847',
                                fillColor: BlackBullColors.white,
                              ),
                            ),
                          ],
                        ),
                        8.verticalGap,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              color: BlackBullColors.gray,
                              width: 1,
                            ),
                            color: BlackBullColors.gray,
                          ),
                          child: _selectedCountry == null
                              ? Container()
                              : Row(
                                  children: <Widget>[
                                    Image.asset(
                                      _selectedCountry!.flag,
                                      package: countryCodePackageName,
                                      width: 45,
                                      height: 35,
                                    ),
                                    5.horizontalGap,
                                    StandardText.body2(
                                      context,
                                      _selectedCountry!.name,
                                    )
                                  ],
                                ),
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: '08/01/1995',
                        ),
                        8.verticalGap,
                      ],
                    ),
                    isActive: _step >= 0,
                    state: _step >= 2
                        ? BSTEPPER.StepState.complete
                        : BSTEPPER.StepState.disabled,
                  ),
                ],
              ),
              20.verticalGap,
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppButton(
                      text: 'Back',
                      radius: 5,
                      textSize: 14,
                      onPressed: cancel,
                      borderColor: BlackBullColors.darkGrey,
                      color: BlackBullColors.darkGrey,
                      textColor: BlackBullColors.white,
                    ),
                  ),
                  15.horizontalGap,
                  Expanded(
                    child: AppButton(
                      text: _step == 3 ? 'Submit' : 'Next',
                      radius: 5,
                      textSize: 14,
                      onPressed: continued,
                      borderColor: BlackBullColors.tertiary,
                      color: BlackBullColors.tertiary,
                      textColor: BlackBullColors.white,
                    ),
                  ),
                ],
              ),
              20.verticalGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StandardText.body2(context, 'Already a client?'),
                  InkWell(
                    onTap: () {
                      getIt<NavigationService>().replaceWithNamed(
                        beamerDelegate: globalBeamerDelegate,
                        uri: NavigationService.loginRouteUri,
                      );
                    },
                    child: StandardText.linkUnderline(
                      context,
                      'Login here',
                      color: BlackBullColors.accent,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
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
        : getIt<NavigationService>().navigateToNamed(
            uri: NavigationService.tradingPreferencesRouteUri,
            beamerDelegate: globalBeamerDelegate,
          );
  }

  cancel() {
    _step > 1
        ? setState(() {
            _step -= 1;
          })
        : null;
  }

  void _onPressedShowBottomSheet(BuildContext context) async {
    final Country? country = await showCountryPickerSheet(
      context,
      cancelWidget: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.cancel),
        ),
      ),
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}
