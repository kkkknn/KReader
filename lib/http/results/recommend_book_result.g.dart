// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_book_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendBookResult _$RecommendBookResultFromJson(Map<String, dynamic> json) =>
    RecommendBookResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendBookResultToJson(
        RecommendBookResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['collections'] as List<dynamic>)
          .map((e) => Collections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'collections': instance.collections,
    };

Collections _$CollectionsFromJson(Map<String, dynamic> json) => Collections(
      json['title'] as String,
      (json['comics'] as List<dynamic>)
          .map((e) => Comics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionsToJson(Collections instance) =>
    <String, dynamic>{
      'title': instance.title,
      'comics': instance.comics,
    };

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      json['_id'] as String,
      json['title'] as String,
      json['author'] as String,
      json['totalViews'] as int,
      json['totalLikes'] as int,
      json['pagesCount'] as int,
      json['epsCount'] as int,
      json['finished'] as bool,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      Thumb.fromJson(json['thumb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'totalViews': instance.totalViews,
      'totalLikes': instance.totalLikes,
      'pagesCount': instance.pagesCount,
      'epsCount': instance.epsCount,
      'finished': instance.finished,
      'categories': instance.categories,
      'thumb': instance.thumb,
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
