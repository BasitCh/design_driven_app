// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          firstName: $checkedConvert('first_name', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as int?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          salutation: $checkedConvert('salutation', (v) => v as String?),
          academicTitle: $checkedConvert('academic_title', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'academicTitle': 'academic_title'
      },
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'salutation': instance.salutation,
      'id': instance.id,
      'academic_title': instance.academicTitle,
    };
