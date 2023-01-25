import 'package:black_bull_markets/domain/my_account/my_account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_account_response.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class MyAccountResponse {
  final List<MyAccount>? myAccounts;

  MyAccountResponse({
    this.myAccounts,
  });

  factory MyAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyAccountResponseToJson(this);
}
