import 'package:black_bull_markets/application/create_wallet/create_wallet_bloc/create_wallet_bloc.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_bloc/my_wallet_bloc.dart';
import 'package:black_bull_markets/presentation/create_new_wallet/create_new_wallet_view.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/carousel_wallet_cards_with_number.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_page_loading.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_header.dart';
import 'package:black_bull_markets/shared/extensions/extensions.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MyWalletBloc>().add(FetchMyWalletItems());
    return BaseScaffold(
      backgroundColor: BlackBullColors.primary,
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            title: 'my_wallet.title'.tr(),
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WalletDashboardHeader(),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            BlocBuilder<MyWalletBloc, MyWalletState>(
              builder: (context, state) {
                return (state is MyWalletStateLoading)
                    ? const MyWalletPageLoading()
                    : (state is MyWalletStateLoaded)
                        ? CarouselWalletCardsWithNumber(
                            widgets: state.sliderWidgets,
                            myWallet: state.myWalletResponse.myWallets ?? [],
                          )
                        : Container();
              },
            ),
            16.verticalGap,
            BlocListener<CreateWalletBloc, CreateWalletState>(
              listener: (context, state) {
                if (kDebugMode) {
                  print(state);
                }
                if (state is CreateWalletStateUploaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.createWalletResponse.message ?? '',
                      ),
                    ),
                  );
                  Navigator.pop(context);
                } else if (state is CreateWalletStateError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppButton(
                  width: context.width,
                  color: BlackBullColors.tertiary,
                  textColor: BlackBullColors.textColorWhite,
                  radius: 8,
                  text: 'create_wallet.title'.tr(),
                  onPressed: () => createNewWalletView(context: context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
