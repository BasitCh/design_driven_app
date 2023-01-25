// ignore_for_file: file_names

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({
    Key? key,
    required this.title,
    this.color = BlackBullColors.black,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Column(
      children: [
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: SvgPicture.asset(
            BlackBullIcons.icLoading,
            fit: BoxFit.contain,
            color: widget.color,
          ),
        ),
        18.verticalGap,
        StandardText.headline1(
          context,
          widget.title.tr(),
          fontWeight: FontWeight.w800,
          fontSize: 22,
          color: widget.color,
        ),
      ],
    );
  }
}
