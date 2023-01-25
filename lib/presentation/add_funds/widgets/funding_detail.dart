import 'package:black_bull_markets/application/add_funds/add_funds_cubit/payement_card_cubit.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/payment_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundingDetailBody extends StatelessWidget {
  const FundingDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: context.read<PaymentCardCubit>().paymentCardList.length,
        itemBuilder: (context, index) => PaymentCardItem(
          paymentCard: context.read<PaymentCardCubit>().paymentCardList[index],
        ),
      ),
    );
  }
}
