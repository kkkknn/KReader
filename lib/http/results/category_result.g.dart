// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResult _$CategoryResultFromJson(Map<String, dynamic> json) =>
    CategoryResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryResultToJson(CategoryResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'categories': instance.categories,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['title'] as String,
      Thumb.fromJson(json['thumb'] as Map<String, dynamic>),
      json['isWeb'] as bool,
      json['active'] as bool,
      json['link'] as String,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumb': instance.thumb,
      'isWeb': instance.isWeb,
      'active': instance.active,
      'link': instance.link,
    };

Thumb _$ThumbFromJson(Map<String, dynamic> json) => Thumb(
      json['originalName'] as String,
      json['path'] as String,
      json['fileServer'] as String,
    );

Map<String, dynamic> _$ThumbToJson(Thumb instance) => <String, dynamic>{
      'originalName': instance.originalName,
      'path': instance.path,
      'fileServer': instance.fileServer,
    };
