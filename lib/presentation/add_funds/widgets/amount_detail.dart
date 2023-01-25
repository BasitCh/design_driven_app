import 'package:black_bull_markets/application/add_funds/add_funds_bloc/add_funds_bloc.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/amount_calculation_item.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/amount_specified_item.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:black_bull_markets/shared/packages/number_input_textfield.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountDetail extends StatelessWidget {
  const AmountDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BlackBullColors.lightGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              StandardText.subtitle1(
                context,
                'add_funds.amount_title'.tr(),
                fontWeight: BlackBullFontWeight.black,
              ),
              StandardText.subtitle1(
                context,
                '*',
                fontWeight: BlackBullFontWeight.black,
              ),
            ],
          ),
          8.verticalGap,
          Flexible(
            child: NumberInputWithIncrementDecrement(
              controller:
                  AddFundsBloc.amountTextEditingController,
              validator: (String? number) {
                if (number!.isNotEmpty) {
                  if (int.parse(number) <= 0) {
                    return 'Amount must be greater than 0';
                  }
                } else if(number.isEmpty) {
                  return 'Please add the amount';
                }else {
                  return null;
                }
                return null;
              },
            ),
          ),
          16.verticalGap,
          const AmountSpecifiedItem(
            values: <String>[
              '50',
              '100',
              '200',
              '300',
              '400',
              '500',
              '600',
            ],
          ),
          36.verticalGap,
          ValueListenableBuilder(
            valueListenable:
                AddFundsBloc.amountTextEditingController,
            builder: (context, amount, _) {
              return AmountCalculationItem(
                heading: 'add_funds.amount_minus'.tr(),
                amount: amount.text,
                currency:
                    context.read<AddFundsCardCubit>().state.currency ?? '-',
              );
            },
          ),
          8.verticalGap,
          AmountCalculationItem(
            heading: 'add_funds.amount_fee'.tr(),
            amount: '0',
            currency: context.read<AddFundsCardCubit>().state.currency ?? '-',
          ),
        ],
      ),
    );
  }
}
