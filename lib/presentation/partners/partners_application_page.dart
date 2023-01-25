import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/application_submission_consts.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/app_dropdown.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_stepper.dart'
    as b_stepper;
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///Partners Application Submission
class PartnersApplicationPage extends StatefulWidget {
  const PartnersApplicationPage({super.key});

  @override
  State<PartnersApplicationPage> createState() =>
      _PartnersApplicationPageState();
}

class _PartnersApplicationPageState extends State<PartnersApplicationPage> {
  int _step = 0;

  String _selectedAccountType = '';
  Country? _selectedCountry;

  @override
  void initState() {
    initCountry();
    super.initState();
    _selectedAccountType = ApplicationSubmissionConsts.accountTypes[0];
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
          'application.partners_step1'.tr(),
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
                'application.partners'.tr(),
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              10.verticalGap,
              NumberStepper(
                totalSteps: 2,
                width: MediaQuery.of(context).size.width / 2,
                curStep: 1,
                stepCompleteColor: BlackBullColors.tertiary,
                currentStepColor: BlackBullColors.accent,
                inactiveColor: BlackBullColors.transparent,
                lineWidth: 3.5,
              ),
              35.verticalGap,
              StandardText.headline4(
                context,
                'application.personal_details'.tr(),
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              _personalDetailsDescription(context),
              30.verticalGap,
              b_stepper.CustomStepper(
                physics: const ScrollPhysics(),
                currentStep: _step,
                onStepTapped: (int step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                controlsBuilder: (
                  BuildContext context,
                  _,
                ) {
                  return const SizedBox.shrink();
                },
                steps: <b_stepper.Step>[
                  b_stepper.Step(
                    title: StandardText.headline4(
                      context,
                      'application.name_email'.tr(),
                      fontSize: 16,
                    ),
                    content: Column(
                      children: <Widget>[
                        AppDropDown(
                          values: ApplicationSubmissionConsts.accountTypes,
                          selectedValue: _selectedAccountType,
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
                        ? b_stepper.StepState.complete
                        : b_stepper.StepState.disabled,
                  ),
                  b_stepper.Step(
                    title: StandardText.headline4(
                      context,
                      'application.address'.tr(),
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
                    state: _step >= 1
                        ? b_stepper.StepState.complete
                        : b_stepper.StepState.disabled,
                  ),
                  b_stepper.Step(
                    title: StandardText.headline4(
                      context,
                      'application.phone_country_dob'.tr(),
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
                        ? b_stepper.StepState.complete
                        : b_stepper.StepState.disabled,
                  ),
                ],
              ),
              20.verticalGap,
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppButton(
                      text: 'buttons.previous'.tr(),
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
                      text: _step == 2
                          ? 'buttons.submit'.tr()
                          : 'buttons.next'.tr(),
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
            ],
          ),
        ),
      ),
    );
  }

  Padding _personalDetailsDescription(BuildContext context) {
    String? stepDescription;

    switch (_step) {
      case 1:
        setState(() => stepDescription = 'application.personal_details_name');

        break;
      case 2:
        setState(
          () => stepDescription = 'application.personal_details_address',
        );

        break;
      case 3:
        setState(
          () => stepDescription = 'application.personal_details_country',
        );

        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: StandardText.body2(
        context,
        stepDescription?.tr() ?? '',
        maxLines: 2,
        align: TextAlign.center,
      ),
    );
  }

  tapped(int step) {
    setState(() {
      _step = step;
    });
  }

  continued() {
    _step == 2
        ? getIt<NavigationService>().navigateToNamed(
            uri: NavigationService.partnersApplicationOptionsRouteUri,
            beamerDelegate: globalBeamerDelegate,
          )
        : setState(() {
            _step += 1;
          });
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
