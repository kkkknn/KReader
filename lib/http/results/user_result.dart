import 'package:json_annotation/json_annotation.dart';

part 'user_result.g.dart';


@JsonSerializable()
class UserResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  UserResult(this.code,this.message,this.data,);

  factory UserResult.fromJson(Map<String, dynamic> srcJson) => _$UserResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'token')
  String token;

  Data(this.token,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}