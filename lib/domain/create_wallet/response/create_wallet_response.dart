import 'package:json_annotation/json_annotation.dart';

part 'create_wallet_response.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class CreateWalletResponse{
  String? message;

  CreateWalletResponse({this.message,});

  factory CreateWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWalletResponseToJson(this);
}
