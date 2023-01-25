import 'package:black_bull_markets/application/singup/cubits/show_hide_confirm_password_cubit.dart';
import 'package:black_bull_markets/application/singup/cubits/show_hide_password_cubit.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          BlocBuilder<ShowHidePasswordCubit, bool>(
            builder: (_, bool isShow) {
              return StandardTextField(
                obscureText: isShow ? true : false,
                controller: passwordController,
                key: const Key(
                  'loginForm_passwordInput_textField',
                ),
                hintText: 'login.password'.tr(),
                textInputAction: TextInputAction.done,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Password can not be empty';
                  } else if (value.length < 8) {
                    return 'The Password must be at least 8 characters';
                  }
                  return null;
                }),
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
                      width: 15,
                      height: 11,
                    ),
                  ),
                ),
              );
            },
          ),
          8.verticalGap,
          BlocBuilder<ShowHideConfirmPasswordCubit, bool>(
            builder: (_, bool isShow) {
              return StandardTextField(
                controller: confirmPasswordController,
                obscureText: isShow ? true : false,
                key: const Key(
                  'loginForm_passwordInput_textField',
                ),
                hintText: 'login.password'.tr(),
                textInputAction: TextInputAction.done,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Confirm password can not be empty';
                  } else if (value.length < 8) {
                    return 'The Password must be at least 8 characters';
                  } else if (passwordController.text.toLowerCase() !=
                      confirmPasswordController.text.toLowerCase()) {
                    return 'Password and confirm password does not match';
                  }
                  return null;
                }),
                suffixWidget: InkWell(
                  onTap: () {
                    isShow
                        ? context
                            .read<ShowHideConfirmPasswordCubit>()
                            .hideConfirmPassword()
                        : context
                            .read<ShowHideConfirmPasswordCubit>()
                            .showConfirmPassword();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      isShow
                          ? BlackBullIcons.icHidePassword
                          : BlackBullIcons.icShowPassword,
                      width: 15,
                      height: 11,
                    ),
                  ),
                ),
              );
            },
          ),
          20.verticalGap,
        ],
      ),
    );
  }
}
