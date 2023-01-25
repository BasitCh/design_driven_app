// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_transfer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalTransferResponse _$InternalTransferResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate(
      'InternalTransferResponse',
      json,
      ($checkedConvert) {
        final val = InternalTransferResponse(
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$InternalTransferResponseToJson(
  InternalTransferResponse instance,
) =>
    <String, dynamic>{
      'message': instance.message,
    };
