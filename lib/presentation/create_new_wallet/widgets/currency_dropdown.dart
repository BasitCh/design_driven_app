import 'package:black_bull_markets/application/create_wallet/create_wallet_cubit/country_cubit.dart';
import 'package:black_bull_markets/domain/create_wallet/country_currency.dart';
import 'package:black_bull_markets/shared/constants/global.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyDropDown extends StatelessWidget {
  const CurrencyDropDown({
    Key? key,
    required this.currencies,
    this.hintText,
  }) : super(key: key);

  final String? hintText;
  final List<CountryCurrency> currencies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryCurrency?>(
      builder: (context, currency) {
        return Container(
          // width: 300.0,
          // height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          decoration: BoxDecoration(
            border: Border.all(color: BlackBullColors.white),
            borderRadius: BorderRadius.circular(8.0),
            color: BlackBullColors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CountryCurrency>(
              hint: hintText != null
                  ? StandardText.caption(context, hintText!,color: BlackBullColors.inputFiledHintColor,)
                  : null,
              value: currency,
              icon: const Icon(Icons.keyboard_arrow_down,),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              style: BlackBullTextStyle.customStyle.copyWith(
                color: BlackBullColors.inputFiledHintColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (CountryCurrency? val) {
                if(val!=null){
                  context.read<CountryCubit>().onCountryPicked(val);
                }
              },
              items: currencies.map<DropdownMenuItem<CountryCurrency>>(
                  (CountryCurrency currency) {
                return DropdownMenuItem<CountryCurrency>(
                  value: currency,
                  child: Row(
                    children: <Widget>[
                  FittedBox(child:getFlagImage(flag: currency.flag ?? ''),),
                      8.horizontalGap,
                      StandardText.body2(
                        context,
                        '${currency.name}',
                      ),
                      150.horizontalGap,
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
    );
  }
}
