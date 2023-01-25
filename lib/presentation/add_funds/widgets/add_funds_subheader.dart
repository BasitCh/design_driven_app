import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddFundsSubheader extends StatelessWidget {
  const AddFundsSubheader({
    Key? key,
    this.title = 'wallet.title',
    this.subtitle = 'wallet.subtitle',
    this.titleColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _AddFundsTitle(
          title: title,
          titleColor: titleColor,
        ),
        const Padding(
          padding: EdgeInsets.all(8),
        ),
        _AddFundsSubtitle(
          subtitle: subtitle,
          subtitleColor: titleColor,
        ),
      ],
    );
  }
}

class _AddFundsTitle extends StatelessWidget {
  const _AddFundsTitle({
    Key? key,
    required this.title,
    this.titleColor,
  }) : super(key: key);
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return StandardText.headline5(
      context,
      title.tr(),
      color: titleColor,
    );
  }
}

class _AddFundsSubtitle extends StatelessWidget {
  const _AddFundsSubtitle({
    Key? key,
    required this.subtitle,
    this.subtitleColor,
  }) : super(key: key);
  final String subtitle;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return StandardText.body2(
      context,
      subtitle.tr(),
      color: subtitleColor,
      maxLines: 3,
      align: TextAlign.center,
      fontSize: 13,
    );
  }
}
