import 'package:json_annotation/json_annotation.dart';

part 'email_availability_response.g.dart';

@JsonSerializable()
class EmailAvailabilityResponse {
  String? status;

  EmailAvailabilityResponse({
    this.status,
  });

  factory EmailAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailAvailabilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAvailabilityResponseToJson(this);
}
