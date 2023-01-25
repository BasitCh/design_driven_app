// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_availability_request.g.dart';

@JsonSerializable(createToJson: true)
class EmailAvailabilityRequest extends Equatable {
  String? email;

  EmailAvailabilityRequest({this.email});

  factory EmailAvailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailAvailabilityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAvailabilityRequestToJson(this);

  @override
  List<Object?> get props => <Object?>[email];

  @override
  bool? get stringify => true;
}
