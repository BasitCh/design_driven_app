// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.subTitle,
    this.canPop = false,
    this.onBack,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final String? subTitle;
  final bool canPop;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BlackBullColors.white,
      elevation: 0,
      leading: const SizedBox(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: canPop
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (canPop)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: onBack,
                  ),
                ),
              subTitle != null
                  ? Flexible(
                      child: Column(
                        children: [
                          StandardText.headline1(
                            context,
                            title,
                            color: BlackBullColors.black,
                            align: TextAlign.start,
                          ),
                          // 4.verticalGap,
                          StandardText.headline3(
                            context,
                            subTitle ?? '',
                            color: BlackBullColors.charcoal,
                            align: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: StandardText.headline1(
                        context,
                        title,
                        color: BlackBullColors.black,
                      ),
                    ),
              if (canPop)
                const Spacer(
                  flex: 4,
                ),
              if (actions != null)
                Row(
                  children: actions!,
                )
            ],
          ),
        ),
      ),
    );
  }
}
