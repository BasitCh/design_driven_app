// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAccount _$MyAccountFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MyAccount',
      json,
      ($checkedConvert) {
        final val = MyAccount(
          id: $checkedConvert('id', (v) => v as String?),
          balance: $checkedConvert('balance', (v) => (v as num?)?.toDouble()),
          name: $checkedConvert('name', (v) => v as String?),
          currency: $checkedConvert('currency', (v) => v as String?),
          color: $checkedConvert('color', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$MyAccountToJson(MyAccount instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'name': instance.name,
      'currency': instance.currency,
      'color': instance.color,
    };
