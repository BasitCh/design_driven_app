import 'package:json_annotation/json_annotation.dart';

part 'create_wallet_request.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class CreateWalletRequest {
  String? userId;
  String? nickName;

  CreateWalletRequest({this.userId, this.nickName,});

  factory CreateWalletRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWalletRequestToJson(this);
}
