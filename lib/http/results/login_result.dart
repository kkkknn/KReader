import 'package:json_annotation/json_annotation.dart';

part 'login_result.g.dart';


@JsonSerializable()
class LoginResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  LoginResult(this.code,this.message,this.data,);

  factory LoginResult.fromJson(Map<String, dynamic> srcJson) => _$LoginResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'token')
  String token;

  Data(this.token,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
