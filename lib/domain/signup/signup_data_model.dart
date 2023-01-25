// ignore_for_file: must_be_immutable, always_specify_types

import 'package:black_bull_markets/shared/base/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_data_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class SignUpDataModel with DataModel implements Equatable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'fax')
  String? fax;
  @JsonKey(name: 'phone')
  String? phone;

  SignUpDataModel({
    this.id,
    this.phone,
    this.fax,
  });

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpDataModelToJson(this);

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
