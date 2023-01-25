import 'package:json_annotation/json_annotation.dart';

part 'my_account.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class MyAccount {
  final String? id;
  final double? balance;
  final String? name;
  final String? currency;
  final String? color;

  MyAccount({
    this.id,
    this.balance,
    this.name,
    this.currency,
    this.color,
  });

  factory MyAccount.fromJson(Map<String, dynamic> json) =>
      _$MyAccountFromJson(json);

  Map<String, dynamic> toJson() => _$MyAccountToJson(this);
}
