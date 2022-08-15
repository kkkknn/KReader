// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResult _$FavoriteResultFromJson(Map<String, dynamic> json) =>
    FavoriteResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteResultToJson(FavoriteResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Comics.fromJson(json['comics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'comics': instance.comics,
    };

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      json['pages'] as int,
      json['total'] as int,
      (json['docs'] as List<dynamic>)
          .map((e) => Docs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'pages': instance.pages,
      'total': instance.total,
      'docs': instance.docs,
      'page': instance.page,
      'limit': instance.limit,
    };

Docs _$DocsFromJson(Map<String, dynamic> json) => Docs(
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
      json['likesCount'] as int,
    );

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
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
      'likesCount': instance.likesCount,
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
