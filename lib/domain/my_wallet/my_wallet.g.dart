// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyWallet _$MyWalletFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MyWallet',
      json,
      ($checkedConvert) {
        final val = MyWallet(
          id: $checkedConvert('id', (v) => v as String?),
          balance: $checkedConvert('balance', (v) => (v as num?)?.toDouble()),
          name: $checkedConvert('name', (v) => v as String?),
          currency: $checkedConvert('currency', (v) => v as String?),
          color: $checkedConvert('color', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$MyWalletToJson(MyWallet instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'name': instance.name,
      'currency': instance.currency,
      'color': instance.color,
    };
