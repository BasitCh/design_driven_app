import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class SignUpResponse {
  @JsonKey(name: 'id')
  int? id;
  SignUpResponse({
    this.id,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
