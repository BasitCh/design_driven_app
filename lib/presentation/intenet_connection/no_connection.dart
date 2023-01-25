
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/no_internet_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: const BaseScaffold(
        backgroundColor: BlackBullColors.blueDark,
        body: NoInternetConnection(),
      ),
    );
  }
}
