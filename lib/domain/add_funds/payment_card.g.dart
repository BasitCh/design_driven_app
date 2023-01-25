// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PaymentCard',
      json,
      ($checkedConvert) {
        final val = PaymentCard(
          imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          fee: $checkedConvert('fee', (v) => v as String?),
          availabilityTime:
              $checkedConvert('availabilityTime', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaymentCardToJson(PaymentCard instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'fee': instance.fee,
      'availabilityTime': instance.availabilityTime,
    };
