import 'package:black_bull_markets/domain/my_account/my_account.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountCardItem extends StatelessWidget {
  const MyAccountCardItem({
    Key? key,
    required this.myAccount,
  }) : super(key: key);

  final MyAccount myAccount;

  @override
  Widget build(BuildContext context) {
    // String combineColor = 'OxFF${myWallet.color}';
    return SizedBox(
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
                    color: Color(int.parse('0xFF${myAccount.color}')),
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
                              text: 'Balance\n',
                              style: BlackBullTextStyle.headline5.copyWith(
                                color: BlackBullColors.textColorWhite,
                              ),
                              children: [
                                TextSpan(
                                  text: '${myAccount.balance ?? 0}',
                                  style: BlackBullTextStyle.headline4.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: BlackBullColors.textColorWhite,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${myAccount.currency}',
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
                  // Flexible(child: 16.verticalGap),
                  // CardDetailBody(
                  //   myWallet: myAccount,
                  // ),
                  //
                  // Flexible(child: 12.verticalGap),
                  // const CardButtons(),
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
                  print('del wallet no ${myAccount.id}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
