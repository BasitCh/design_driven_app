import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class ConfirmationDetailItem extends StatelessWidget {
  const ConfirmationDetailItem({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(12),
      height: 136,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: BlackBullColors.greyGradientContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: StandardText.headline5(
                context,
                title!,
              ),
            ),
          if (subtitle != null) Column(
            children: [
              10.verticalGap,
              subtitle!,
            ],
          ),
        ],
      ),
    );
  }
}
