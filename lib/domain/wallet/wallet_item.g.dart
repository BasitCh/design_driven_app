// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletItem _$WalletItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WalletItem',
      json,
      ($checkedConvert) {
        final val = WalletItem(
          id: $checkedConvert('id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
          arguement: $checkedConvert('arguement', (v) => v),
          routeName: $checkedConvert('routeName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$WalletItemToJson(WalletItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'arguement': instance.arguement,
      'routeName': instance.routeName,
    };
