import 'package:black_bull_markets/application/create_wallet/create_wallet_bloc/create_wallet_bloc.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_cubit/country_cubit.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_cubit/nickname_cubit.dart';
import 'package:black_bull_markets/domain/create_wallet/country_currency.dart';
import 'package:black_bull_markets/domain/create_wallet/request/create_wallet_request.dart';
import 'package:black_bull_markets/presentation/create_new_wallet/widgets/currency_dropdown.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/constants/global.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/bottom_bar.dart';

import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> createNewWalletView({required BuildContext context}) {
  return showBottomBar(
    context,
    onClose: () {
      Navigator.pop(context);
      context.read<CountryCubit>().onCloseBottomSheet();
    },
    subtitle: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BlackBullColors.white,
      ),
      height: 225,
      child: Column(
        children: [
          Flexible(
            child: Container(
              // color: CupertinoColors.black,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: StandardTextField(
                onChanged: (String value) {},
                hintText: 'create_wallet.nickname'.tr(),
                inputBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: BlackBullColors.inputFieldBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: BlackBullColors.inputFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 25,
                bottom: 25,
              ),
              child: CurrencyDropDown(
                currencies: currencies,
                hintText: 'create_wallet.select_currency'.tr(),
              ),
            ),
          ),
        ],
      ),
    ),
    footer: [
      AppButton(
        text: 'create_wallet.button'.tr(),
        width: 250,
        height: 45,
        radius: 8,
        onPressed: () {
          if (kDebugMode) {
            print('akjhsdfk');
          }
          context.read<CreateWalletBloc>().add(
                UploadNewWallet(
                  createWalletRequest: CreateWalletRequest(
                    userId: 'user_id_1',
                    nickName: context.read<NicknameCubit>().state,
                  ),
                ),
              );
        },
        color: BlackBullColors.white,
        enableColor: BlackBullColors.accent,
      ),
    ],
  );
}
