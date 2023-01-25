import 'package:black_bull_markets/domain/create_wallet/country_currency.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/constants/currency.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerGlobalKey =
    GlobalKey();

List<CountryCurrency> currencies = [
  CountryCurrency(
    name: BlackBullCurrency.AUD.name,
    flag: BlackBullImages.audFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.CAD.name,
    flag: BlackBullImages.cadFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.EUR.name,
    flag: BlackBullImages.eurFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.GBP.name,
    flag: BlackBullImages.gbpFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.JPY.name,
    flag: BlackBullImages.jpyFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.NZD.name,
    flag: BlackBullImages.nzdFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.SGD.name,
    flag: BlackBullImages.sgdFlag,
  ),
  CountryCurrency(
    name: BlackBullCurrency.USD.name,
    flag: BlackBullImages.usdFlag,
  ),
];

getFlagImage({required String flag}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: BlackBullColors.gray,),
      borderRadius: BorderRadius.circular(4,),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4,),
      child: Image.asset(
        flag,
        width: 40,
        height: 30,
          fit: BoxFit.cover,
      ),
    ),
  );
}
