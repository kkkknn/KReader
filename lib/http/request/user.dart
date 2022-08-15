import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  User(this.email,this.password,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


