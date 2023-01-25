import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_item.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class WalletItem extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;
  final dynamic arguement;
  final String? routeName;

  const WalletItem({
    this.id,
    this.title,
    this.imageUrl,
    this.arguement,
    this.routeName,
  });

  factory WalletItem.fromJson(Map<String, dynamic> json) =>
      _$WalletItemFromJson(json);

  Map<String, dynamic> toJson() => _$WalletItemToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        arguement,
        routeName,
      ];
}
