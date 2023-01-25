import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.onChange,
    this.hintText,
  });

  final String selectedValue;
  final String? hintText;
  final List<String> values;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(8),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: BlackBullColors.white,
        ),
        hint: Text(hintText ?? ''),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: BlackBullColors.black,
          size: 20,
        ),
        isExpanded: true,
        isDense: true,
        value: selectedValue.isNotEmpty ? selectedValue : null,
        items: values.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: StandardText.body2(context, item),
          );
        }).toList(),
        validator: (Object? value) =>
            value?.toString() == null || value.toString().isEmpty
                ? 'Cannot Empty'
                : null,
        onChanged: (Object? selectedItem) {
          onChange.call(selectedItem.toString());
        },
      ),
    );
  }
}
