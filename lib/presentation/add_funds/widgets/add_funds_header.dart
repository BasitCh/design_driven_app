import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class AddFundsHeader extends StatelessWidget {
  const AddFundsHeader({Key? key,
  required this.title,
  this.detailText,
  }) : super(key: key);

  final String title;
  final String? detailText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StandardText.headline4(
          context,
          title,
        ),
        Visibility(
          visible: detailText!=null,
          child: StandardText.headline4(
          context,
          ' > $detailText',
        ),),
      ],
    );
  }
}
