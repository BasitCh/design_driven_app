import 'package:black_bull_markets/application/wallet/wallet_bloc/wallet_bloc.dart';
import 'package:black_bull_markets/domain/wallet/wallet_item.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_loading.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletDashboardBody extends StatelessWidget {
  const WalletDashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is WalletStateLoaded && state.isNavigated) {
          if (state.walletItem != null) {
            if (state.walletItem!.routeName ==
                NavigationService.myWalletRouteUri) {
              getIt<NavigationService>().navigateToNamed(
                uri: NavigationService.myWalletRouteUri,
                beamerDelegate: globalBeamerDelegate,
              );
            } else if (state.walletItem!.routeName ==
                NavigationService.internalTransferRouteUri) {
              getIt<NavigationService>().navigateToNamed(
                uri: NavigationService.internalTransferRouteUri,
                beamerDelegate: globalBeamerDelegate,
              );
            }else if (state.walletItem!.routeName ==
                NavigationService.addFundsRouteUri) {
              getIt<NavigationService>().navigateToNamed(
                uri: NavigationService.addFundsRouteUri,
                beamerDelegate: globalBeamerDelegate,
              );
            }
          }
        }
      },
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (BuildContext context, WalletState state) => (state
                is WalletStateLoading)
            ? const WalletDashboardLoading()
            : (state is WalletStateLoaded)
                ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.walletItems.length,
                    itemBuilder: (BuildContext context, int index) => Material(
                      child: InkWell(
                        splashColor: BlackBullColors.primary,
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          if (kDebugMode) {
                            print(index);
                          }
                          context.read<WalletBloc>().add(
                                NavigateToNext(
                                  walletItem: state.walletItems[index],
                                ),
                              );
                        },
                        child: _MyWalletItem(
                          walletItem: state.walletItems[index],
                        ),
                      ),
                    ),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                  )
                : (state is WalletStateError)
                    ? Center(
                        child: StandardText.body2(
                          context,
                          'Error while fetching',
                        ),
                      )
                    : Container(),
      ),
    );
  }
}

class _MyWalletItem extends StatelessWidget {
  const _MyWalletItem({
    Key? key,
    required this.walletItem,
  }) : super(key: key);

  final WalletItem walletItem;
  // final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: BlackBullColors.gridBox,
      ),
      child: Column(
        children: <Widget>[
          if (walletItem.imageUrl != null)
            SvgPicture.asset(walletItem.imageUrl!),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          StandardText.headline5(
            context,
            walletItem.title ?? 'N/A',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
