// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_or_favorite_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeOrFavoriteResult _$LikeOrFavoriteResultFromJson(
        Map<String, dynamic> json) =>
    LikeOrFavoriteResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikeOrFavoriteResultToJson(
        LikeOrFavoriteResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['action'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'action': instance.action,
    };
