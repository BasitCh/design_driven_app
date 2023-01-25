// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignUpResponse',
      json,
      ($checkedConvert) {
        final val = SignUpResponse(
          id: $checkedConvert('id', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
