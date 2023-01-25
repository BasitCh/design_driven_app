import 'package:json_annotation/json_annotation.dart';

part 'payment_card.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class PaymentCard{
  final String? imageUrl;
  final String? name;
  final String? description;
  final String? fee;
  final String? availabilityTime;


  PaymentCard({
    this.imageUrl,
    this.name,
    this.description,
    this.fee,
    this.availabilityTime,
});

  factory PaymentCard.empty()=>PaymentCard(
  imageUrl:'',
  name:'',
  description:'',
  fee:'',
  availabilityTime:'',
  );

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);
}
