import 'package:black_bull_markets/shared/base/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_data_model.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ErrorDataModel with DataModel implements Equatable {
  final int? errorCode;
  final String? message;

  ErrorDataModel({this.errorCode, this.message});

  factory ErrorDataModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataModelFromJson(json);

  @override
  List<Object?> get props => <Object?>[errorCode, message];

  @override
  bool? get stringify => true;
}
