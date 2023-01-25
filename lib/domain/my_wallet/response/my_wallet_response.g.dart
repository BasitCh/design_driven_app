// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyWalletResponse _$MyWalletResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MyWalletResponse',
      json,
      ($checkedConvert) {
        final val = MyWalletResponse(
          myWallets: $checkedConvert(
            'myWallets',
            (v) => (v as List<dynamic>?)
                ?.map((e) => MyWallet.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$MyWalletResponseToJson(MyWalletResponse instance) =>
    <String, dynamic>{
      'myWallets': instance.myWallets,
    };
