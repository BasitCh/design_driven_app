// ignore_for_file: library_prefixes

import 'package:black_bull_markets/application/singup/cubits/select_country_cubit.dart';
import 'package:black_bull_markets/application/singup/cubits/show_hide_confirm_password_cubit.dart';
import 'package:black_bull_markets/application/singup/cubits/show_hide_password_cubit.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/signup/widgets/name_and_email_widget.dart';
import 'package:black_bull_markets/presentation/signup/widgets/password_widget.dart';
import 'package:black_bull_markets/presentation/signup/widgets/phone_and_country_widget.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_stepper.dart'
    as BSTEPPER;
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _step = 1;
  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
          'Onboarding - Step2',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ShowHidePasswordCubit>(
            create: ((_) => ShowHidePasswordCubit()),
          ),
          BlocProvider<ShowHideConfirmPasswordCubit>(
            create: ((_) => ShowHideConfirmPasswordCubit()),
          ),
          BlocProvider<SelectCountryCubit>(
              create: ((context) => SelectCountryCubit()))
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                StandardText.headline4(
                  context,
                  'Account Registration',
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
                15.verticalGap,
                StandardText.headline4(
                  context,
                  'PERSONAL DETAILS',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
                5.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StandardText.body2(
                    context,
                    'Select account type, Enter Name\n and review the email.',
                    maxLines: 2,
                    align: TextAlign.center,
                  ),
                ),
                20.verticalGap,
                BSTEPPER.CustomStepper(
                  physics: const ScrollPhysics(),
                  currentStep: _step - 1,
                  onStepTapped: (int step) {},
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
                      content: NameAndEmailWidget(
                        formKey: formKeys[0],
                        onNextPress: continued,
                      ),
                      isActive: _step >= 0,
                      state: _step >= 0
                          ? BSTEPPER.StepState.complete
                          : BSTEPPER.StepState.disabled,
                    ),
                    BSTEPPER.Step(
                      title: StandardText.headline4(
                        context,
                        'Phone & Country:',
                        fontSize: 16,
                      ),
                      content: PhoneAndCountryWidget(
                        formKey: formKeys[1],
                        onNextPress: continued,
                      ),
                      isActive: _step >= 0,
                      state: _step >= 2
                          ? BSTEPPER.StepState.complete
                          : BSTEPPER.StepState.disabled,
                    ),
                    BSTEPPER.Step(
                      title: StandardText.headline4(
                        context,
                        'Password & Confirmation:',
                        fontSize: 16,
                      ),
                      content: PasswordWidget(
                        formKey: formKeys[2],
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
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
                    _step == 1
                        ? const SizedBox.shrink()
                        : Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: AppButton(
                                    text: 'PREVIOUS',
                                    radius: 5,
                                    textSize: 14,
                                    onPressed: cancel,
                                    borderColor: BlackBullColors.darkGrey,
                                    color: BlackBullColors.darkGrey,
                                    textColor: BlackBullColors.white,
                                  ),
                                ),
                                15.horizontalGap,
                              ],
                            ),
                          ),
                    Expanded(
                      child: AppButton(
                        text: 'SUBMIT',
                        radius: 5,
                        textSize: 14,
                        onPressed: continued,
                        borderColor: BlackBullColors.tertiary,
                        color: BlackBullColors.tertiary,
                        textColor: BlackBullColors.white,
                        isPrefixIcon: false,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StandardText.body2(context, 'Already a client?'),
                    3.horizontalGap,
                    InkWell(
                      onTap: () {
                        getIt<NavigationService>().replaceWithNamed(
                          beamerDelegate: globalBeamerDelegate,
                          uri: NavigationService.loginRouteUri,
                        );
                      },
                      child: StandardText.linkUnderline(
                        context,
                        'Login Here',
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
      ),
    );
  }

  continued() {
    if (formKeys[_step - 1].currentState!.validate()) {
      _step < 3
          ? setState(() {
              _step += 1;
            })
          : getIt<NavigationService>().navigateToNamed(
              beamerDelegate: globalBeamerDelegate,
              uri: NavigationService.singUpSuccessUri,
            );
    }
  }

  cancel() {
    _step > 1
        ? setState(() {
            _step -= 1;
          })
        : null;
  }
}
