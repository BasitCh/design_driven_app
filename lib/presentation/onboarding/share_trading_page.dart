// ignore_for_file: library_prefixes

import 'package:black_bull_markets/application/share_trading_cubit/share_trading_cubit.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/trading_preference_item.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_stepper.dart'
    as BSTEPPER;
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:black_bull_markets/shared/widgets/switch_selection.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareTradingPage extends StatefulWidget {
  const ShareTradingPage({super.key});

  @override
  State<ShareTradingPage> createState() => _ShareTradingPageState();
}

class _ShareTradingPageState extends State<ShareTradingPage> {
  int _step = 1;
  Country? _selectedCountry;
  Country? _taxCountry;
  @override
  void initState() {
    initCountry();
    super.initState();
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
          _taxCountry = country;
        });
      }
    });
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

  void _onPressedShowBottomSheetTaxCountry(BuildContext context) async {
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
        _taxCountry = country;
      });
    }
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
          'Share Trading- Application Step 1',
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
                'Share Trading',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              10.verticalGap,
              NumberStepper(
                totalSteps: 4,
                width: MediaQuery.of(context).size.width,
                curStep: _step + 1,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'SHARE TRADING PREFERENCES',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: StandardText.body2(
                  context,
                  'Confirm your password and details to get started.',
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
                      'Country & Tax details',
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
                                hintText: 'Country of Birth',
                                fillColor: BlackBullColors.white,
                              ),
                            ),
                          ],
                        ),
                        8.verticalGap,
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () =>
                                  _onPressedShowBottomSheetTaxCountry(context),
                              child: Container(
                                width: 60,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: BlackBullColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: _taxCountry == null
                                    ? Container()
                                    : Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Image.asset(
                                              _taxCountry!.flag,
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
                                hintText: 'Tax Residency',
                                fillColor: BlackBullColors.white,
                              ),
                            ),
                          ],
                        ),
                        8.verticalGap,
                        const StandardTextField(
                          hintText: 'Tax identification Number',
                          fillColor: BlackBullColors.white,
                        ),
                        20.verticalGap,
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
                        20.verticalGap,
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
                      'Account Currency:',
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        const TradingPreferenceItem(
                          title: '',
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
                        20.verticalGap,
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
                        20.verticalGap,
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
                      'Account Type',
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        BlocBuilder<ShareTradingCubit, SELECTION>(
                          builder: (_, SELECTION selection) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SwitchSelection(
                                  onTap: () {
                                    context.read<ShareTradingCubit>().cash();
                                  },
                                  title: 'shareTrading.cash'.tr().toUpperCase(),
                                  color: selection == SELECTION.cash
                                      ? BlackBullColors.blueDark
                                      : BlackBullColors.offWhite,
                                  boxShadowColor: selection == SELECTION.cash
                                      ? BlackBullColors.blueDark
                                      : BlackBullColors.borderColor,
                                  textColor: selection == SELECTION.cash
                                      ? BlackBullColors.white
                                      : BlackBullColors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  isLeftBorder: true,
                                ),
                                SwitchSelection(
                                  onTap: () {
                                    context.read<ShareTradingCubit>().margin();
                                  },
                                  title:
                                      'shareTrading.margin'.tr().toUpperCase(),
                                  color: selection == SELECTION.margin
                                      ? BlackBullColors.blueDark
                                      : BlackBullColors.offWhite,
                                  boxShadowColor: selection == SELECTION.margin
                                      ? BlackBullColors.blueDark
                                      : BlackBullColors.borderColor,
                                  textColor: selection == SELECTION.margin
                                      ? BlackBullColors.white
                                      : BlackBullColors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  isLeftBorder: false,
                                ),
                              ],
                            );
                          },
                        ),
                        20.verticalGap,
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
                        20.verticalGap,
                      ],
                    ),
                    isActive: _step >= 0,
                    state: _step >= 0
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
            beamerDelegate: globalBeamerDelegate,
            uri: NavigationService.singUpSuccessUri,
          );
  }

  cancel() {
    _step > 1
        ? setState(() {
            _step -= 1;
          })
        : null;
  }
}
