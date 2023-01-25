import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_wallet_response.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class MyWalletResponse {
  final List<MyWallet>? myWallets;

  MyWalletResponse({
    this.myWallets,
  });

  factory MyWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$MyWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyWalletResponseToJson(this);
}
