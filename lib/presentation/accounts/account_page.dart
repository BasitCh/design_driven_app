import 'package:black_bull_markets/application/accounts/account_cubit/live_demo_cubit.dart';
import 'package:black_bull_markets/application/accounts/my_accounts_bloc/my_account_bloc.dart';
import 'package:black_bull_markets/presentation/accounts/widgets/carousel_account_cards_with_number.dart';
import 'package:black_bull_markets/presentation/accounts/widgets/myaccount_page_loading.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/bottom_sheets.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/switch_selection.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  late CarouselController carouselController;
  late MyAccountBloc myAccountBloc;
  @override
  void initState() {
    myAccountBloc = context.read<MyAccountBloc>()..add(FetchMyAccountItems());
    carouselController = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.primary,
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
            title: 'Accounts',
          );
        },
      ),
      bullPath: BlackBullImages.bullGrey,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 50.verticalGap,
            StandardText.headline1(
              context,
              'accounts.accounts'.tr(),
              color: BlackBullColors.black,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
            20.verticalGap,
            Row(
              children: <Widget>[
                BlocBuilder<LiveDemoCubit, SELECTION>(
                  builder: (_, SELECTION selection) {
                    return Row(
                      children: <Widget>[
                        30.horizontalGap,
                        SwitchSelection(
                        onTap: () {
                          context.read<LiveDemoCubit>().live();
                        },
                          title: 'accounts.live'.tr(),
                          color: selection == SELECTION.live
                              ? BlackBullColors.green
                              : BlackBullColors.offWhite,
                          boxShadowColor: selection == SELECTION.live
                              ? BlackBullColors.green
                              : BlackBullColors.borderColor,
                          textColor: selection == SELECTION.live
                              ? BlackBullColors.white
                              : BlackBullColors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          indicationColor: selection == SELECTION.live
                              ? BlackBullColors.orange
                              : BlackBullColors.transparent,
                          isLeftBorder: true,
                        ),
                        SwitchSelection(
                          onTap: () {
                            context.read<LiveDemoCubit>().demo();
                          },
                          title: 'accounts.demo'.tr(),
                          color: selection == SELECTION.demo
                              ? BlackBullColors.green
                              : BlackBullColors.offWhite,
                          boxShadowColor: selection == SELECTION.demo
                              ? BlackBullColors.green
                              : BlackBullColors.borderColor,
                          textColor: selection == SELECTION.demo
                              ? BlackBullColors.white
                              : BlackBullColors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          indicationColor: selection == SELECTION.demo
                              ? BlackBullColors.orange
                              : BlackBullColors.transparent,
                          isLeftBorder: false,
                        ),
                      ],
                    );
                  },
                ),
                20.horizontalGap,
                Expanded(
                  child: AppButton(
                    text: 'accounts.createAnAccount'.tr(),
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      BottomSheets.openCreateAccount(context);
                    },
                    textSize: 12.0,
                    color: BlackBullColors.blue,
                    radius: 4,
                    height: 32.0,
                    borderColor: BlackBullColors.blue,
                  ),
                ),
                20.horizontalGap
              ],
            ),
            72.verticalGap,
            BlocBuilder<MyAccountBloc, MyAccountState>(
              builder: (context, state) {
                return (state is MyAccountStateLoading)
                    ? const MyAccountPageLoading()
                    : (state is MyAccountStateLoaded)
                        ? CarouselAccountsCardsWithNumber(
                            widgets: state.sliderWidgets,
                            index: _selectedIndex,
                            onItemChanged: (index) {
                              _selectedIndex.value = index;
                            },
                            carouselController: carouselController,
                            myAccount: state.myAccountResponse.myAccounts ?? [],
                          )
                        : Container();
              },
            ),

            // InfoBox(
            //   iconPath: BlackBullIcons.icAlert,
            //   mainHeading: StandardText.headline1(
            //     context,
            //     'No accounts',
            //     color: BlackBullColors.redDark,
            //     fontWeight: FontWeight.w700,
            //     fontSize: 14,
            //     align: TextAlign.start,
            //   ),
            //   backColor: BlackBullColors.redLight,
            //   subHeading: StandardText.headline1(
            //     context,
            //     'No trading accounts to show.',
            //     color: BlackBullColors.redDark,
            //     fontWeight: FontWeight.w600,
            //     fontSize: 12,
            //     align: TextAlign.start,
            //   ),
            //   borderRadius: 8.0,
            // ),
            // 7.verticalGap,
            // InfoBox(
            //   iconPath: BlackBullIcons.icWarning,
            //   mainHeading: StandardText.headline1(
            //     context,
            //     'Create account',
            //     color: BlackBullColors.yellow,
            //     fontWeight: FontWeight.w700,
            //     fontSize: 14,
            //     align: TextAlign.start,
            //   ),
            //   backColor: BlackBullColors.yellowLight,
            //   subHeading: StandardText.headline1(
            //     context,
            //     'Please complete the application process to create a live trading account.',
            //     color: BlackBullColors.yellow,
            //     fontWeight: FontWeight.w600,
            //     align: TextAlign.start,
            //     fontSize: 12,
            //   ),
            //   borderRadius: 8.0,
            // ),
            // 25.verticalGap,
            AppButton(
              text: 'accounts.createAnAccount'.tr(),
              fontWeight: FontWeight.w700,
              onPressed: () {
                BottomSheets.openCreateAccount(context);
              },
              width: 250,
              textSize: 16.0,
              color: BlackBullColors.green,
              radius: 8.0,
              borderColor: BlackBullColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
