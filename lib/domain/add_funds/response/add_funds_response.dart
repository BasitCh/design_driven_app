import 'package:json_annotation/json_annotation.dart';

part 'add_funds_response.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class AddFundsResponse {
    final String? message;

    AddFundsResponse({this.message});

    factory AddFundsResponse.fromJson(Map<String, dynamic> json) =>
        _$AddFundsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AddFundsResponseToJson(this);
}
