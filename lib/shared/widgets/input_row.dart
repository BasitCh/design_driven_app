import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputRow extends StatelessWidget {
  const InputRow({
    Key? key,
    required this.name,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    this.height = 35.0,
  }) : super(key: key);
  final String name;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 80,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Flexible(
          child: SizedBox(
            width: 450,
            child: SizedBox(
              height: height,
              child: FormBuilderTextField(
                name: name,
                controller: controller,
                keyboardType: inputType,
                textInputAction: inputAction,
                decoration: const InputDecoration(
                  labelText: '',
                  contentPadding:
                      EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: BlackBullColors.navBlue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: BlackBullColors.navBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
