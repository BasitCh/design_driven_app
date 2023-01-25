import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class AmountCalculationItem extends StatelessWidget {
  const AmountCalculationItem({
    Key? key,
    required this.heading,
    required this.currency,
    required this.amount,
  }) : super(key: key);
  final String heading;
  final String amount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StandardText.caption(
          context,
          heading,
          fontWeight: BlackBullFontWeight.semiBold,
        ),
        RichText(
          text: TextSpan(
            style: BlackBullTextStyle.caption.copyWith(
              color: BlackBullColors.tertiary,
              fontWeight: BlackBullFontWeight.extraBold,
            ),
            text: currency,
            children: [
              TextSpan(
                text: ' $amount',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
