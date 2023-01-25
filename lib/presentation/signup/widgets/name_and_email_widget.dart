import 'package:black_bull_markets/shared/core/email_validator.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:flutter/material.dart';

class NameAndEmailWidget extends StatelessWidget {
  const NameAndEmailWidget(
      {required this.formKey, required this.onNextPress, super.key});

  final GlobalKey<FormState> formKey;
  final Function() onNextPress;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          StandardTextField(
            hintText: 'michaelwalker@blackbullmarkets.com',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              } else if (!EmailValidator.validate(value)) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          8.verticalGap,
          StandardTextField(
            hintText: 'First Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter first name';
              }
              return null;
            },
          ),
          8.verticalGap,
          StandardTextField(
            hintText: 'Last Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter last name';
              }
              return null;
            },
          ),
          20.verticalGap,
          AppButton(
            text: 'Next',
            width: 100,
            height: 30,
            radius: 5,
            textSize: 14,
            onPressed: onNextPress,
            color: BlackBullColors.black,
            textColor: BlackBullColors.white,
          ),
          20.verticalGap,
        ],
      ),
    );
  }
}
