import 'package:black_bull_markets/domain/add_funds/payment_card.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmationPaymentCardItem extends StatelessWidget {
  const ConfirmationPaymentCardItem({
    Key? key,
    required this.paymentCard,
  }) : super(key: key);

  final PaymentCard paymentCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (paymentCard.imageUrl != null)
            Flexible(
                child: Image.asset(
              paymentCard.imageUrl!,
                  width: 100,
                  height: 50,
            ),),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StandardText.headline5(
                  context,
                  paymentCard.name ?? '-',
                  color: BlackBullColors.tertiary,
                  fontSize: 14,
                ),
                5.verticalGap,
                StandardText.body2(
                  context,
                  'my_wallet.name'.tr(),
                  fontSize: 11.4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
