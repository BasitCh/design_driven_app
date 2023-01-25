import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_number_cubit.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/card_buttons.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/card_detail_body.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyWalletCardItem extends StatelessWidget {
  const MyWalletCardItem({
    Key? key,
    required this.myWallet,
    this.isAddFundsPage=false,
  }) : super(key: key);

  final MyWallet myWallet;
  final bool isAddFundsPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAddFundsPage?(){
        context.read<AddFundsNumberCubit>().onWalletSelected();
        context.read<AddFundsCardCubit>().onWalletSelected(myWallet: myWallet,);
      }:null,
      child: SizedBox(
        width: 280,
        child: Stack(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: BlackBullColors.tertiary,
                      color: Color(int.parse('0xFF${myWallet.color}')),
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            BlackBullIcons.flag,
                          ),
                          8.verticalGap,
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'my_wallet.balance'.tr(),
                                style: BlackBullTextStyle.headline5.copyWith(
                                  color: BlackBullColors.textColorWhite,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${myWallet.balance ?? 0}',
                                    style: BlackBullTextStyle.headline4.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: BlackBullColors.textColorWhite,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${myWallet.currency}',
                                    style: BlackBullTextStyle.headline4.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: BlackBullColors.textColorWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(child: 16.verticalGap),
                    CardDetailBody(
                      myWallet: myWallet,
                    ),
                    Flexible(child: 12.verticalGap),
                    CardButtons(
                      isAddFundsPage: isAddFundsPage,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: IconButton(
                iconSize: 50,
                icon: SvgPicture.asset(
                  BlackBullIcons.deleteWallet,
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print('del wallet no ${myWallet.id}');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
