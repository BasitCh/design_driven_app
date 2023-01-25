// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_funds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFundsResponse _$AddFundsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AddFundsResponse',
      json,
      ($checkedConvert) {
        final val = AddFundsResponse(
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$AddFundsResponseToJson(AddFundsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
