import 'package:black_bull_markets/application/singup/email_availability/email_availability_bloc.dart';
import 'package:black_bull_markets/domain/signup/request/email_availability_request.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/infrastructure/signup/signup_repository.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/core/email_validator.dart';
import 'package:black_bull_markets/shared/core/social_login_singup.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:black_bull_markets/shared/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputEmailPage extends StatefulWidget {
  const InputEmailPage({super.key});

  @override
  State<InputEmailPage> createState() => _InputEmailPageState();
}

class _InputEmailPageState extends State<InputEmailPage> {
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
          ),
          onPressed: () => getIt<NavigationService>()
              .navigateBack(beamerDelegate: globalBeamerDelegate),
        ),
        title: StandardText.headline4(
          context,
          'Onboarding - Step1',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: BlocProvider(
        create: (_) => EmailAvailabilityBloc(
          signUpRepository: RepositoryProvider.of<SignUpRepository>(context),
        ),
        child: InputEmailView(),
      ),
    );
  }
}

class InputEmailView extends StatelessWidget {
  InputEmailView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final int _step = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<EmailAvailabilityBloc>(),
      listener: (context, state) {
        if (state is EmailAvailablityStatus) {
          if (state.isAvailable) {
            getIt<NavigationService>().navigateToNamed(
              uri: NavigationService.singUpRouteUri,
              beamerDelegate: globalBeamerDelegate,
            );
          }
        } else if (state is ErrorCheckingEmail) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: StandardText.headline1(
                  context,
                  state.error,
                  fontSize: 12,
                  color: BlackBullColors.white,
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  15.verticalGap,
                  StandardText.headline4(
                    context,
                    'Account Registration',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                  20.verticalGap,
                  NumberStepper(
                    totalSteps: 4,
                    width: MediaQuery.of(context).size.width,
                    curStep: _step + 1,
                    stepCompleteColor: BlackBullColors.tertiary,
                    currentStepColor: BlackBullColors.accent,
                    inactiveColor: BlackBullColors.transparent,
                    lineWidth: 3.5,
                  ),
                  40.verticalGap,
                  StandardText.headline4(
                    context,
                    'Create an account\n& start trading.',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                  20.verticalGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StandardText.body2(
                      context,
                      'You are just 4 simple steps away from placing your first trade.',
                      maxLines: 2,
                      align: TextAlign.center,
                    ),
                  ),
                  40.verticalGap,
                  SocialMediaLogin(
                    borderColor: BlackBullColors.lightGrey,
                    backGroundColor: BlackBullColors.transparent,
                    borderWidth: 1,
                    onPressedGoogle: () async {
                      UserCredential userCredential =
                          await SocialLoginSingUp.signInWithGoogle();
                      if (kDebugMode) {
                        print(
                          'userCredential.user.email ${userCredential.user!.email}',
                        );
                        controller.text = userCredential.user?.email ?? '';
                      }
                    },
                    onPressedFaceBook: () async {
                      UserCredential userCredential =
                          await SocialLoginSingUp.signInWithFacebook();
                      if (kDebugMode) {
                        print(
                          'userCredential.user.email facebook ${userCredential.user!.email}',
                        );
                      }
                      controller.text = userCredential.user?.email ?? '';
                    },
                    onPressedApple: () {},
                  ),
                  20.verticalGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      StandardText.headline1(
                        context,
                        '.............................  ',
                        fontSize: 12.0,
                        color: BlackBullColors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: StandardText.headline1(
                          context,
                          'login.or'.tr(),
                          fontSize: 12.0,
                          color: BlackBullColors.black,
                        ),
                      ),
                      StandardText.headline1(
                        context,
                        '  .............................',
                        fontSize: 12.0,
                        color: BlackBullColors.black,
                      )
                    ],
                  ),
                  20.verticalGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: <Widget>[
                        StandardTextField(
                          controller: controller,
                          hintText: 'Email Address',
                          fillColor: BlackBullColors.white,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          }),
                        ),
                        10.verticalGap,
                        AppButton(
                          text: 'Get Started',
                          width: double.infinity,
                          color: BlackBullColors.tertiary,
                          textColor: BlackBullColors.white,
                          borderColor: BlackBullColors.tertiary,
                          isLoading: state is CheckingEmail,
                          radius: 8,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<EmailAvailabilityBloc>().add(
                                    CheckEmail(
                                      request: EmailAvailabilityRequest(
                                        email: controller.text,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  30.verticalGap,
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
        );
      },
    );
  }
}
