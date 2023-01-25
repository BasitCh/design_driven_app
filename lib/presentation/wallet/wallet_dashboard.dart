// ignore_for_file: always_use_package_imports

import 'package:black_bull_markets/application/common/common_bloc.dart';
import 'package:black_bull_markets/application/wallet/wallet_bloc/wallet_bloc.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/helpers/colors.dart';
import '../../shared/widgets/base_scaffold.dart';
import 'widgets/wallet_dashboard_header.dart';

class WalletDashboard extends StatefulWidget {
  const WalletDashboard({Key? key}) : super(key: key);

  @override
  State<WalletDashboard> createState() => _WalletDashboardState();
}

class _WalletDashboardState extends State<WalletDashboard> {
  @override
  Widget build(BuildContext context) {
    context.read<WalletBloc>().add(FetchWalletItems());
    return BlocBuilder<CommonBloc, CommonState>(
      builder: (context, state) {
        return BaseScaffold(
          backgroundColor: BlackBullColors.primary,
          appBar: Builder(
            builder: (context) {
              return MyWalletAppBar(
                onDrawerPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                onNotificationPressed: () {},
              );
            },
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                // vertical: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  WalletDashboardHeader(),
                  Padding(
                    padding: EdgeInsets.all(16),
                  ),
                  WalletDashboardBody(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
