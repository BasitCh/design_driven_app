import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class CarouselButton extends StatelessWidget {
  const CarouselButton({
    Key? key,
    this.title = '',
    this.onTap,
    this.child,
    this.unSelectedColor,
    this.isSelected = false,
  }) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final Widget? child;
  final bool? isSelected;
  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSelected! && title.isNotEmpty ? 44 : 34,
        height: isSelected! && title.isNotEmpty ? 44 : 34,

        alignment: Alignment.center,
        margin:  EdgeInsets.only(
          left:child==null?10:0,right: child==null?10:0,
        ),

        // padding:EdgeInsets.all(
        //   child==null?5:0,
        // ),
        decoration: child==null?BoxDecoration(
          border: Border.all(
            color: isSelected! && title.isNotEmpty
                ? BlackBullColors.textColorWhite
                : unSelectedColor==null?BlackBullColors.black:BlackBullColors.transparent,
          ),
          // borderRadius: BorderRadius.circular(45),
          shape: BoxShape.circle,
          color: isSelected! && title.isNotEmpty
              ? BlackBullColors.accent
              : unSelectedColor??BlackBullColors.transparent,
        ):null,

        child: child ??
            StandardText.button(
              title,
              color: isSelected! && title.isNotEmpty
                  ? BlackBullColors.textColorWhite
                  : BlackBullColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }
}
