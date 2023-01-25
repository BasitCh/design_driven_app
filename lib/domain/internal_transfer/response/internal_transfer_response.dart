import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'internal_transfer_response.g.dart';

@JsonSerializable(checked: true, createToJson: true)
class InternalTransferResponse extends Equatable {
  final String? message;

  const InternalTransferResponse({
    this.message,
  });

  factory InternalTransferResponse.fromJson(Map<String, dynamic> json) =>
      _$InternalTransferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InternalTransferResponseToJson(this);

  @override
  List<Object?> get props => [message];
}
