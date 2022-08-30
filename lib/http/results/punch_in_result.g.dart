// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punch_in_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PunchInResult _$PunchInResultFromJson(Map<String, dynamic> json) =>
    PunchInResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PunchInResultToJson(PunchInResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Res.fromJson(json['res'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'res': instance.res,
    };

Res _$ResFromJson(Map<String, dynamic> json) => Res(
      json['status'] as String,
    );

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'status': instance.status,
    };
