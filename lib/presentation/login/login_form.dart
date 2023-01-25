import 'package:black_bull_markets/application/login/login_bloc/login_bloc.dart';
import 'package:black_bull_markets/application/login/login_cubit/remeber_me_cubit.dart';
import 'package:black_bull_markets/application/login/login_cubit/show_hide_password_cubit.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key,required this.password,required this.email}) : super(key: key);
  final TextEditingController password ;
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: StandardText.headline1(context, state.errors!.email![0].tr(),fontSize: 12,color: BlackBullColors.white,)),
            );
          getIt<NavigationService>().replaceWithNamed(
            beamerDelegate: globalBeamerDelegate,
            uri: NavigationService.applicationRouteUri,
          );
        } else if (state is LoginLoaded) {
          getIt<NavigationService>().replaceWithNamed(
            beamerDelegate: globalBeamerDelegate,
            uri: NavigationService.applicationRouteUri,
          );
        } else if (state is LoginLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                  'Loading',
                ),
              ),
            );
        }
      },
      child: Form(
        child: Column(
          children: <Widget>[
            47.verticalGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: _EmailInput(email),
            ),
            10.verticalGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: _PasswordInput(password),
            ),
            12.verticalGap,
            Container(
              alignment: Alignment.topLeft,
              child: BlocBuilder<RememberMeCubit, bool>(
                builder: (_, bool isCheck) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          checkColor: BlackBullColors.inputFiledHintColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return Colors.white;
                          }),
                          activeColor: BlackBullColors.white,
                          value: isCheck,
                          onChanged: (bool? value) {
                            isCheck
                                ? context.read<RememberMeCubit>().unChecked()
                                : context.read<RememberMeCubit>().checked();
                          },
                        ),
                        StandardText.headline1(
                          context,
                          'login.checkBoxText'.tr(),
                          fontWeight: FontWeight.w600,
                          color: BlackBullColors.white,
                          fontSize: 13.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            5.verticalGap,
            SizedBox(width: 300, child: _LoginButton(email: email,password: password,)),
            20.verticalGap,
            StandardText.headline1(
              context,
              'login.noClientYet'.tr(),
              fontSize: 15,
              color: BlackBullColors.white,
              fontWeight: FontWeight.w600,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'login.signupFor'.tr(),
                style: BlackBullTextStyle.customStyle.copyWith(
                  fontSize: 15,
                  color: BlackBullColors.white,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'login.live'.tr(),
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: BlackBullColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                        getIt<NavigationService>().navigateToNamed(
                          beamerDelegate: globalBeamerDelegate,
                          uri: NavigationService.personalDetailsRouteUri,
                        );
                      },
                  ),
                  TextSpan(
                    text: ', ',
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      color: BlackBullColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      },
                  ),
                  TextSpan(
                    text: 'login.demo'.tr(),
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: BlackBullColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                        getIt<NavigationService>().navigateToNamed(
                          beamerDelegate: globalBeamerDelegate,
                          uri: NavigationService.personalDetailsRouteUri,
                        );
                      },
                  ),
                  TextSpan(
                    text: 'login.or'.tr().toLowerCase(),
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      color: BlackBullColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      },
                  ),
                  TextSpan(
                    text: ' ',
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      color: BlackBullColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      },
                  ),
                  TextSpan(
                    text: 'Share',
                    style: BlackBullTextStyle.customStyle.copyWith(
                      fontSize: 15,
                      color: BlackBullColors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        getIt<NavigationService>().navigateToNamed(
                          beamerDelegate: globalBeamerDelegate,
                          uri: NavigationService.personalDetailsRouteUri,
                        );
                      },
                  ),
                ],
              ),
            ),
            StandardText.headline1(
              context,
              'login.tradingAccount'.tr(),
              fontSize: 15,
              color: BlackBullColors.white,
              fontWeight: FontWeight.w600,
            ),
            20.verticalGap,
            InkWell(
              onTap: () {
                getIt<NavigationService>().navigateToNamed(
                  beamerDelegate: globalBeamerDelegate,
                  uri: NavigationService.inputBirthRouteUri,
                );
              },
              child: StandardText.underline(
                context,
                'Create new user',
                fontSize: 15,
                color: BlackBullColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput(this.email);
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.username != current.username,
      builder: (BuildContext context, LoginState state) {
        return StandardTextField(
          controller: email,
          key: const Key('loginForm_email'),
          onChanged: (String username) =>
              context.read<LoginBloc>().add(LoginUserEmailChanged(username)),
          hintText: 'login.email'.tr(),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput(this.password);
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.password != current.password,
      builder: (BuildContext context, LoginState state) {
        return BlocBuilder<ShowHidePasswordCubit, bool>(
          builder: (_, bool isShow) {
            return StandardTextField(
              controller: password,
              obscureText: isShow ? true : false,
              key: const Key('loginForm_passwordInput_textField'),
              hintText: 'login.password'.tr(),
              textInputAction: TextInputAction.done,
              onChanged: (String password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              suffixWidget: InkWell(
                onTap: () {
                  isShow
                      ? context.read<ShowHidePasswordCubit>().hidePassword()
                      : context.read<ShowHidePasswordCubit>().showPassword();
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    isShow
                        ? BlackBullIcons.icHidePassword
                        : BlackBullIcons.icShowPassword,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.password, required this.email});
  final TextEditingController password;
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.status != current.status,
      builder: (BuildContext context, LoginState state) {
        return state.status.isSubmissionInProgress
            ? const LinearProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: BlackBullColors.green,
                  disabledBackgroundColor: BlackBullColors.white,
                ),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(LoginSubmitted(password:password.text,email: email.text));
                      }
                    : null,
                child: StandardText.headline1(
                  color: state.status.isValidated
                      ? BlackBullColors.white
                      : BlackBullColors.inputFiledHintColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  context,
                  'login.title'.tr().toUpperCase(),
                ),
              );
      },
    );
  }
}
