import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/payement_card_cubit.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/confirmation_detail_item.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/card_detail_body.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/confirmation_payment_card_item.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationDetail extends StatelessWidget {
  const ConfirmationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConfirmationDetailItem(
          title: 'create_wallet.nickname'.tr(),
          subtitle: CardDetailBody(
            myWallet: context.read<AddFundsCardCubit>().state,
            isAddFundsView: true,
          ),
        ),
        12.verticalGap,
        ConfirmationDetailItem(
          title: 'add_funds.payment_method'.tr(),
          subtitle: ConfirmationPaymentCardItem(
            paymentCard: context.read<PaymentCardCubit>().state,
          ),
        ),
        12.verticalGap,
        ConfirmationDetailItem(
          title: 'add_funds.order_ref'.tr(),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StandardText.headline5(
                  context,
                  'D3485c82c8b215',
                  color: BlackBullColors.tertiary,
                  fontSize: 14,
                ),
                5.verticalGap,
                StandardText.body2(
                  context,
                  'Ref',
                  fontSize: 11.4,
                ),
              ],
            ),
          ),
        ),
        26.verticalGap,
      ],
    );
  }
}
