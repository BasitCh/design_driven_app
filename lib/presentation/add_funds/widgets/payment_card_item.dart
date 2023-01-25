import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_number_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/payement_card_cubit.dart';
import 'package:black_bull_markets/domain/add_funds/payment_card.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem({
    Key? key,
    required this.paymentCard,
  }) : super(key: key);

  final PaymentCard paymentCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PaymentCardCubit>().onCardSelected(paymentCard);
        context.read<AddFundsNumberCubit>().onNextPage();
        // print(context.read<PaymentCardCubit>().state.name);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 8,
          right: 16,
          left: 16,
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        //   color: BlackBullColors.accent,
        // ),
        // width: 250,
        height: 290,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (paymentCard.imageUrl != null)
                Image.asset(paymentCard.imageUrl!),
              8.verticalGap,
              StandardText.headline4(
                context,
                paymentCard.name ?? '',
              ),
              8.verticalGap,
              StandardText.body2(
                context,
                paymentCard.description ?? '',
                align: TextAlign.center,
                fontSize: 14,
              ),
              StandardText.body2(
                context,
                paymentCard.fee ?? '',
                align: TextAlign.center,
                fontWeight: BlackBullFontWeight.extraBold,
              ),
              8.verticalGap,
              StandardText.body2(
                context,
                paymentCard.availabilityTime ?? '',
                align: TextAlign.center,
                fontWeight: BlackBullFontWeight.extraBold,
                color: BlackBullColors.tertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
