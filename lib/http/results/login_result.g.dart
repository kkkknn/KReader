// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
    };
