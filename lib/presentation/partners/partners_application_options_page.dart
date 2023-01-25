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
import 'package:black_bull_markets/shared/widgets/bottom_sheets.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/onboarding_card_widget.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:black_bull_markets/shared/widgets/submitted_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///Partners Application Submission
class PartnersApplicationOptionsPage extends StatefulWidget {
  const PartnersApplicationOptionsPage({super.key});

  @override
  State<PartnersApplicationOptionsPage> createState() =>
      _PartnersApplicationPageState();
}

class _PartnersApplicationPageState
    extends State<PartnersApplicationOptionsPage> {
  String _partnerSelectedAccountType =
      ApplicationSubmissionConsts.partnerAccountTypes[0];
  String _clientsRegion = ApplicationSubmissionConsts.clientRegions[0];
  String _clientEachMonth = ApplicationSubmissionConsts.howManyClientsRef[0];
  String _businessType = ApplicationSubmissionConsts.typesOfBusinesses[0];

  @override
  void initState() {
    super.initState();
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
          'application.partners_step2'.tr(),
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
                curStep: 2,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: StandardText.body2(
                  context,
                  'application.personal_details_step2_description'.tr(),
                  maxLines: 2,
                  align: TextAlign.center,
                ),
              ),
              30.verticalGap,
              OnboardingCard(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandardText.headline4(
                      context,
                      'application.partner_account_type'.tr(),
                      fontSize: 16,
                    ),
                    const SizedBox(height: 10.0),
                    AppDropDown(
                      values: ApplicationSubmissionConsts.partnerAccountTypes,
                      selectedValue: _partnerSelectedAccountType,
                      onChange: (String accountType) {
                        setState(() {
                          _partnerSelectedAccountType = accountType;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    StandardText.headline4(
                      context,
                      'application.which_other_brokers'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    StandardTextField(
                      hintText: 'application.current_broker'.tr(),
                      fillColor: BlackBullColors.white,
                    ),
                  ],
                ),
              ),
              OnboardingCard(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandardText.headline4(
                      context,
                      'application.what_region'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    AppDropDown(
                      values: ApplicationSubmissionConsts.clientRegions,
                      selectedValue: _clientsRegion,
                      onChange: (String region) {
                        setState(() {
                          _clientsRegion = region;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    StandardText.headline4(
                      context,
                      'application.how_may_clients'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    AppDropDown(
                      values: ApplicationSubmissionConsts.howManyClientsRef,
                      selectedValue: _clientEachMonth,
                      onChange: (String clients) {
                        setState(() {
                          _clientEachMonth = clients;
                        });
                      },
                    ),
                  ],
                ),
              ),
              OnboardingCard(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandardText.headline4(
                      context,
                      'application.what_type_business'.tr(),
                      fontSize: 16,
                    ),
                    const SizedBox(height: 10.0),
                    AppDropDown(
                      values: ApplicationSubmissionConsts.typesOfBusinesses,
                      selectedValue: _businessType,
                      onChange: (String types) {
                        setState(() {
                          _businessType = types;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    StandardText.headline4(
                      context,
                      'application.main_refferal_site'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    StandardTextField(
                      hintText: 'application.type_url'.tr(),
                      fillColor: BlackBullColors.white,
                    ),
                  ],
                ),
              ),
              OnboardingCard(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandardText.headline4(
                      context,
                      'application.brief_description_business'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    StandardTextField(
                      hintText: 'application.description'.tr(),
                      fillColor: BlackBullColors.white,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              OnboardingCard(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandardText.headline4(
                      context,
                      'application.provide_info'.tr(),
                      fontSize: 16,
                    ),
                    const SizedBox(height: 10.0),
                    StandardText.body2(
                      context,
                      'application.provide_info_desc'.tr(),
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 20.0),
                    StandardTextField(
                      hintText: 'application.description'.tr(),
                      fillColor: BlackBullColors.white,
                      maxLines: 6,
                    ),
                  ],
                ),
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
                      text: 'buttons.submit'.tr(),
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

  continued() {
    BottomSheets.declarationAlert(
      context: context,
      onContinue: () => getIt<NavigationService>().navigateToNamed(
        uri: NavigationService.submittedSuccessRouteURI,
        beamerDelegate: globalBeamerDelegate,
        data: SubmittedPageArgs(
          continueText: 'buttons.go_home'.tr().toUpperCase(),
          onContinue: () {
            getIt<NavigationService>().navigateToNamed(
              uri: NavigationService.applicationRouteUri,
              beamerDelegate: globalBeamerDelegate,
            );
          },
        ),
      ),
    );
  }

  cancel() => Navigator.of(context).pop();
}
