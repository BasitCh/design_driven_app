import 'package:black_bull_markets/application/accounts/account_bloc/create_account_bloc.dart';
import 'package:black_bull_markets/application/login/login_cubit/remeber_me_cubit.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/custom_drop_down.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class BottomSheets {
  static void turnOnNotification(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: BlackBullColors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: BlackBullColors.blueDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    13.verticalGap,
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.topRight,
                        //padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(
                          BlackBullIcons.icCloseButton,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    37.verticalGap,
                    SvgPicture.asset(BlackBullIcons.icBell),
                    31.verticalGap,
                    StandardText.headline1(
                      context,
                      'notifications.mainHeading'.tr(),
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                      color: BlackBullColors.white,
                    ),
                    23.verticalGap,
                    StandardText.headline1(
                      context,
                      'notifications.subHeading'.tr(),
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: BlackBullColors.white,
                    ),
                    43.verticalGap,
                    AppButton(
                      text: 'notifications.buttonText'.tr().toUpperCase(),
                      borderColor: BlackBullColors.white,
                      color: BlackBullColors.white,
                      textColor: BlackBullColors.blueDark,
                      width: 300,
                      radius: 8.0,
                    ),
                    26.verticalGap,
                    AppButton(
                      text: 'notifications.notNowText'.tr(),
                      borderColor: BlackBullColors.transparent,
                      color: BlackBullColors.transparent,
                      textColor: BlackBullColors.white,
                      width: 300,
                      radius: 8.0,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void openCreateAccount(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: BlackBullColors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.only(left: 41.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: BlackBullColors.blueDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              13.verticalGap,
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SvgPicture.asset(
                    BlackBullIcons.icCloseButton,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              StandardText.headline1(
                context,
                'accounts.mainHeading'.tr(),
                fontWeight: FontWeight.w800,
                fontSize: 22.0,
                color: BlackBullColors.white,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 36.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      26.0.verticalGap,
                      StandardText.headline1(
                        context,
                        'accounts.platformType'.tr(),
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        align: TextAlign.left,
                        color: BlackBullColors.white,
                      ),
                      9.0.verticalGap,
                      BlocBuilder<CreateAccountBloc, CreateAccountState>(
                        buildWhen: (
                          CreateAccountState previous,
                          CreateAccountState current,
                        ) =>
                            previous.platFormType != current.platFormType,
                        builder:
                            (BuildContext context, CreateAccountState state) {
                          return CustomDropDown(
                            dropDownItem: const <String>[
                              'accounts.platformTypeList.selectPlatformType',
                              'accounts.platformTypeList.tradingView',
                              'accounts.platformTypeList.metaTrader4',
                              'accounts.platformTypeList.metaTrader5'
                            ],
                            dropdownValue: '',
                            onChangedValue: (String? value) {
                              if (kDebugMode) {
                                print('value: ${value!.tr()}');
                              }
                              String checkValue = value!.tr();
                              if (value.tr().toLowerCase() == 'platform type') {
                                checkValue = '';
                              }
                              context
                                  .read<CreateAccountBloc>()
                                  .add(PlateFormTypeChanged(checkValue));
                            },
                          );
                        },
                      ),
                      9.0.verticalGap,
                      StandardText.headline1(
                        context,
                        'accounts.nickname'.tr(),
                        fontWeight: FontWeight.w700,
                        align: TextAlign.left,
                        fontSize: 16.0,
                        color: BlackBullColors.white,
                      ),
                      9.0.verticalGap,
                      StandardTextField(
                        onTap: () {},
                        hintText: 'accounts.nickname'.tr(),
                      ),
                      9.0.verticalGap,
                      StandardText.headline1(
                        context,
                        'accounts.currency'.tr(),
                        fontWeight: FontWeight.w700,
                        align: TextAlign.left,
                        fontSize: 16.0,
                        color: BlackBullColors.white,
                      ),
                      9.0.verticalGap,
                      BlocBuilder<CreateAccountBloc, CreateAccountState>(
                        buildWhen: (
                          CreateAccountState previous,
                          CreateAccountState current,
                        ) =>
                            previous.currency != current.currency,
                        builder:
                            (BuildContext context, CreateAccountState state) {
                          return CustomDropDown(
                            dropDownItem: const <String>[
                              'accounts.currencyList.selectCurrency',
                              'accounts.currencyList.usd',
                              'accounts.currencyList.eur',
                              'accounts.currencyList.gpb',
                              'accounts.currencyList.aud',
                              'accounts.currencyList.nzd',
                              'accounts.currencyList.sgd',
                              'accounts.currencyList.cad',
                              'accounts.currencyList.jpy'
                            ],
                            dropdownValue: '',
                            onChangedValue: (String? value) {
                              if (kDebugMode) {
                                print('value: ${value!.tr()}');
                              }
                              String checkValue = value!.tr();
                              if (value.tr().toLowerCase() == 'currency') {
                                checkValue = '';
                              }
                              context
                                  .read<CreateAccountBloc>()
                                  .add(CurrencyChanged(checkValue));
                            },
                          );
                        },
                      ),
                      9.0.verticalGap,
                      StandardText.headline1(
                        context,
                        'accounts.accountType'.tr(),
                        align: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: BlackBullColors.white,
                      ),
                      9.0.verticalGap,
                      BlocBuilder<CreateAccountBloc, CreateAccountState>(
                        buildWhen: (
                          CreateAccountState previous,
                          CreateAccountState current,
                        ) =>
                            previous.currency != current.currency,
                        builder:
                            (BuildContext context, CreateAccountState state) {
                          return CustomDropDown(
                            dropDownItem: const <String>[
                              'accounts.accountTypeList.selectAccountType',
                              'accounts.accountTypeList.standard',
                              'accounts.accountTypeList.prime',
                              'accounts.accountTypeList.islamicStandard',
                              'accounts.accountTypeList.islamicPrime'
                            ],
                            dropdownValue: '',
                            onChangedValue: (String? value) {
                              if (kDebugMode) {
                                print('value: ${value!.tr()}');
                              }
                              String checkValue = value!.tr();
                              if (value.tr().toLowerCase() == 'account type') {
                                checkValue = '';
                              }
                              context
                                  .read<CreateAccountBloc>()
                                  .add(AccountTypeChanged(checkValue));
                            },
                          );
                        },
                      ),
                      9.0.verticalGap,
                      StandardText.headline1(
                        context,
                        'accounts.leverage'.tr(),
                        align: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: BlackBullColors.white,
                      ),
                      9.0.verticalGap,
                      BlocBuilder<CreateAccountBloc, CreateAccountState>(
                        buildWhen: (
                          CreateAccountState previous,
                          CreateAccountState current,
                        ) =>
                            previous.currency != current.currency,
                        builder:
                            (BuildContext context, CreateAccountState state) {
                          return CustomDropDown(
                            dropDownItem: const <String>[
                              'accounts.leverageList.selectLeverage',
                              'accounts.leverageList.1',
                              'accounts.leverageList.33',
                              'accounts.leverageList.50',
                              'accounts.leverageList.100',
                              'accounts.leverageList.200',
                              'accounts.leverageList.300',
                              'accounts.leverageList.400',
                              'accounts.leverageList.500'
                            ],
                            dropdownValue: '',
                            onChangedValue: (String? value) {
                              if (kDebugMode) {
                                print('value: ${value!.tr()}');
                              }
                              String checkValue = value!.tr();
                              if (value.tr().toLowerCase() == 'leverage') {
                                checkValue = '';
                              }
                              context
                                  .read<CreateAccountBloc>()
                                  .add(LeverageChanged(checkValue));
                            },
                          );
                        },
                      ),
                      52.0.verticalGap,
                      BlocBuilder<CreateAccountBloc, CreateAccountState>(
                        buildWhen: (
                          CreateAccountState previous,
                          CreateAccountState current,
                        ) =>
                            previous.status != current.status,
                        builder:
                            (BuildContext context, CreateAccountState state) {
                          return AppButton(
                            text: 'accounts.submit'.tr().toUpperCase(),
                            width: 200,
                            radius: 4,
                            textSize: 15,
                            fontWeight: FontWeight.w800,
                            textColor: BlackBullColors.blueDark,
                            onPressed: state.status.isValidated
                                ? () {
                                    context
                                        .read<CreateAccountBloc>()
                                        .add(const LiveAccountSubmitted());
                                  }
                                : null,
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void declarationAlert({
    required BuildContext context,
    String? continueText,
    Function()? onContinue,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: BlackBullColors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: BlackBullColors.blueDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    5.verticalGap,
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.topRight,
                        //padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(
                          BlackBullIcons.icCloseButton,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    37.verticalGap,
                    SvgPicture.asset(BlackBullIcons.declarationIcon),
                    31.verticalGap,
                    StandardText.headline1(
                      context,
                      'Declaration',
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                      color: BlackBullColors.white,
                    ),
                    23.verticalGap,
                    StandardText.headline1(
                      context,
                      // 'notifications.subHeading'.tr(),
                      'By opening an account with BlackBull Group Limited, you have indicated that you have read, understood and agreed to the terms set out in each of the following:',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      align: TextAlign.start,
                      color: BlackBullColors.white,
                    ),
                    10.verticalGap,
                    _declarationItem(context: context, text: '. Risk Warning'),
                    10.verticalGap,
                    _declarationItem(
                        context: context, text: '. Privacy Policy'),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text: '. Financial Services Guide',
                    ),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text: '. Trading Terms of Service',
                    ),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text: '. Product Disclosure Statement',
                    ),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text: '. Client Services Agreement',
                    ),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text: '. Complaints Handling Procedure',
                    ),
                    10.verticalGap,
                    _declarationItem(
                      context: context,
                      text:
                          'By opening a live account, I confirm that I am authorised to provide the personal details presented and I consent to my information being checked with the document issuer or official record holder via third party systems for the purpose of confirming my identity.',
                    ),
                    15.verticalGap,
                    Container(
                      transform: Matrix4.translationValues(-15, 0, 0),
                      child: BlocBuilder<RememberMeCubit, bool>(
                        builder: (_, bool isCheck) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                checkColor: BlackBullColors.inputFiledHintColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  return Colors.white;
                                }),
                                activeColor: BlackBullColors.white,
                                value: isCheck,
                                onChanged: (bool? value) {
                                  isCheck
                                      ? context
                                          .read<RememberMeCubit>()
                                          .unChecked()
                                      : context
                                          .read<RememberMeCubit>()
                                          .checked();
                                },
                              ),
                              StandardText.headline1(
                                context,
                                'I agree to all of the above',
                                fontWeight: FontWeight.w600,
                                color: BlackBullColors.white,
                                fontSize: 13.0,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    30.verticalGap,
                    AppButton(
                      text: continueText ?? 'quiz.continue'.tr().toUpperCase(),
                      borderColor: BlackBullColors.white,
                      color: BlackBullColors.white,
                      textColor: BlackBullColors.blueDark,
                      enableColor: BlackBullColors.blueDark,
                      width: 300,
                      radius: 8.0,
                      onPressed:
                          onContinue ?? () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Widget _declarationItem({required BuildContext context, required String text}) {
  return StandardText.headline1(
    context,
    text,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    align: TextAlign.start,
    color: BlackBullColors.white,
  );
}
