import 'package:json_annotation/json_annotation.dart';

part 'my_wallet.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class MyWallet {
  final String? id;
  final double? balance;
  final String? name;
  final String? currency;
  final String? color;
  @JsonKey(ignore: true)
  final bool isAddFundsPage;

  MyWallet({
    this.id,
    this.balance,
    this.name,
    this.currency,
    this.color,
    this.isAddFundsPage=false,
  });

  factory MyWallet.empty()=>MyWallet(
    id: '',
    balance: 0,
    name: '',
    currency: '',
    color: '',
  );

  MyWallet copyWith({
    String? id,
  double? balance,
  String? name,
  String? currency,
   String? color,
  bool? isAddFundsPage,})=>MyWallet(
    id: id?? this.id,
    balance: balance?? this.balance,
    name: name?? this.name,
    currency: currency?? this.currency,
    isAddFundsPage: isAddFundsPage?? this.isAddFundsPage,
    color: color?? this.color,
    );

  factory MyWallet.fromJson(Map<String, dynamic> json) =>
      _$MyWalletFromJson(json);

  Map<String, dynamic> toJson() => _$MyWalletToJson(this);
}
