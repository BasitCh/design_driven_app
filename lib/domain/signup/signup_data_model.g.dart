// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpDataModel _$SignUpDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignUpDataModel',
      json,
      ($checkedConvert) {
        final val = SignUpDataModel(
          id: $checkedConvert('id', (v) => v as int?),
          phone: $checkedConvert('phone', (v) => v as String?),
          fax: $checkedConvert('fax', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SignUpDataModelToJson(SignUpDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fax': instance.fax,
      'phone': instance.phone,
    };
