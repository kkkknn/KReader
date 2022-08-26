// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_words_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyWordsResult _$KeyWordsResultFromJson(Map<String, dynamic> json) =>
    KeyWordsResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyWordsResultToJson(KeyWordsResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'keywords': instance.keywords,
    };
