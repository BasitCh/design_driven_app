import 'dart:ui';

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

showBottomBar(
  BuildContext context, {
  List<Widget>? footer,
  String? title,
  Widget? subtitle,
      required void Function()? onClose,
      double? height=470,
}) {
  return showModalBottomSheet(
    isScrollControlled:true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    backgroundColor: BlackBullColors.primary,
    context: context,
    builder: (_) => Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: BlackBullColors.accent,
          ),
          height: height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onClose,
                  icon: SvgPicture.asset(
                    BlackBullIcons.closeButton,
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: StandardText.headline3(
                  context,
                  title?? 'create_wallet.new_wallet'.tr(),
                  color: BlackBullColors.textColorWhite,
                  fontWeight: FontWeight.w900,
                  align: TextAlign.center,
                ),
              ),
              if (subtitle != null) 10.verticalGap,
              if (subtitle != null) subtitle,
              if (footer != null) 10.verticalGap,
              if (footer != null)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 14.0,
                    right: 14.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: footer,
                  ),
                )
            ],
          ),
        ),
      ),
    ),
  );
}
