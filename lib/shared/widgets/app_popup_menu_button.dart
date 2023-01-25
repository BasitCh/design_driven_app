import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:flutter/material.dart';

class AppPopUpMenuButton<T> extends StatelessWidget {
  const AppPopUpMenuButton({
    Key? key,
    this.onSelected,
    this.color = BlackBullColors.accent,
    this.child,
    required this.itemBuilder,
    this.offset = const Offset(0, -110),
  }) : super(key: key);

  final void Function(T)? onSelected;
  final Color color;
  final List<PopupMenuEntry<T>> Function(BuildContext) itemBuilder;
  final Widget? child;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      splashRadius: 1,
      onSelected: onSelected,
      offset: offset,
      color: color,
      tooltip: '',
      itemBuilder: itemBuilder,
      child: child ??
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: const Icon(
              Icons.menu_sharp,
            ),
          ),
    );
  }
}
