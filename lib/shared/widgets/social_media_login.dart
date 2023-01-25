// ignore_for_file: always_specify_types

import 'dart:io';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaLogin extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedFaceBook;
  final VoidCallback onPressedApple;
  const SocialMediaLogin({
    Key? key,
    required this.onPressedGoogle,
    required this.onPressedFaceBook,
    required this.onPressedApple,
    this.borderColor,
    this.borderWidth,
    this.backGroundColor,
  }) : super(key: key);

  final Color? borderColor;
  final double? borderWidth;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressedGoogle,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor ?? BlackBullColors.white,
                ),
                color: backGroundColor ?? BlackBullColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    BlackBullIcons.icGoogle,
                    fit: BoxFit.contain,
                    height: 22,
                    // fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  StandardText.headline1(
                    color: BlackBullColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    context,
                    'login.google'.tr(),
                  ),
                ],
              ),
            ),
          ),
          borderColor != null
              ? const SizedBox.shrink()
              : const VerticalDivider(
                  width: 2,
                  color: BlackBullColors.borderColor,
                ),
          Visibility(
            visible: Platform.isIOS,
            child: InkWell(
              onTap: onPressedApple,
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: borderColor ?? BlackBullColors.white),
                  color: backGroundColor ?? BlackBullColors.white,
                  //borderRadius: const BorderRadius.only(topLeft:Radius.circular(4.0),bottomLeft:Radius.circular(4.0) ),
                ),
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      BlackBullIcons.icApple,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    StandardText.headline1(
                      color: BlackBullColors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      context,
                      'login.apple'.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          borderColor != null
              ? const SizedBox.shrink()
              : Visibility(
                  visible: Platform.isIOS,
                  child: const VerticalDivider(
                    width: 2,
                    color: BlackBullColors.borderColor,
                  ),
                ),

          InkWell(
            onTap: onPressedFaceBook,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor ?? BlackBullColors.white),
                color: backGroundColor ?? BlackBullColors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    BlackBullIcons.icFaceBook,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  StandardText.headline1(
                    color: BlackBullColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    context,
                    'login.facebook'.tr(),
                  ),
                ],
              ),
            ),
          ),
          // Text("data"),
        ],
      ),
    );
  }
}
