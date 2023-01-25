import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class User extends Equatable {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'salutation')
  final String? salutation;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'academic_title')
  final String? academicTitle;

  const User({
    this.firstName,
    this.id,
    this.lastName,
    this.salutation,
    this.academicTitle,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => <Object?>[firstName, lastName, id, salutation];

  @override
  bool? get stringify => true;
}
