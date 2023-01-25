import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

typedef StringCallBack = void Function(String);

class Prefix extends StatefulWidget {
  const Prefix({Key? key, required this.onPrefixChange}) : super(key: key);
  final Function(String) onPrefixChange;

  @override
  State<Prefix> createState() => _PrefixState();
}

class _PrefixState extends State<Prefix> {
  List<String> prefixOptions = <String>['Mr.', 'Ms.', 'Sr.'];
  String prefixValue = 'Mr.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 2, left: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              const Text(
                'home.prefix',
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ).tr(),
              const SelectableText(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  // fontFeatures: [
                  //   FontFeature.superscripts(),
                  // ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: 100,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
            border: Border.all(
              width: 1,
              color: BlackBullColors.navBlue,
            ),
          ),
          child: DropdownButton<String>(
            value: prefixValue,
            onChanged: (String? value) {
              widget.onPrefixChange(value!);
              setState(() {
                prefixValue = value;
              });
            },
            underline: Container(),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
            isExpanded: true,
            dropdownColor: Colors.black87,
            items: prefixOptions
                .map(
                  (String e) => DropdownMenuItem<String>(
                    value: e,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            selectedItemBuilder: (BuildContext context) => prefixOptions
                .map(
                  (String e) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
