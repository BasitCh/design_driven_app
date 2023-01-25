import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
            title: title,
          );
        },
      ),
      body: Center(
        child: StandardText.headline4(
          context,
          'Page is under construction',
        ),
      ),
    );
  }
}
