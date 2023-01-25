import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key? key,
    required this.dropDownItem,
    required this.dropdownValue,
    required this.onChangedValue,
    this.icon,
    this.hintText,
    this.width,
  }) : super(key: key);
  final List<String> dropDownItem;
  final String dropdownValue;
  final ValueChanged<String> onChangedValue;
  final Widget? icon;
  final String? hintText;
  final double? width;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 300.0,
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
        border: Border.all(color: BlackBullColors.white),
        borderRadius: BorderRadius.circular(8.0),
        color: BlackBullColors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: widget.hintText != null
              ? StandardText.headline1(context, widget.hintText!)
              : const Text(''),
          value: widget.hintText != null ? null : widget.dropDownItem[index],
          icon: widget.icon ?? const Icon(Icons.arrow_drop_down),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          style: BlackBullTextStyle.customStyle.copyWith(
            color: BlackBullColors.inputFiledHintColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          onChanged: (String? value) {
            setState(() {
              index = widget.dropDownItem.indexOf(value!);
            });
            widget.onChangedValue(value!);
          },
          items:
              widget.dropDownItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: StandardText.headline1(
                context,
                value.tr(),
                color: BlackBullColors.inputFiledHintColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
