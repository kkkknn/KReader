// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
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
      json['total'] as int,
      json['page'] as int,
      json['pages'] as int,
      (json['docs'] as List<dynamic>)
          .map((e) => Docs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['limit'] as int,
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'docs': instance.docs,
      'limit': instance.limit,
    };

Docs _$DocsFromJson(Map<String, dynamic> json) => Docs(
      json['updated_at'] as String,
      Thumb.fromJson(json['thumb'] as Map<String, dynamic>),
      json['author'] as String,
      json['description'] as String,
      json['chineseTeam'] as String,
      json['created_at'] as String,
      json['finished'] as bool,
      json['totalViews'] as int,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      json['totalLikes'] as int,
      json['title'] as String,
      json['tags'] as List<dynamic>,
      json['_id'] as String,
      json['likesCount'] as int,
    );

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
      'updated_at': instance.updatedAt,
      'thumb': instance.thumb,
      'author': instance.author,
      'description': instance.description,
      'chineseTeam': instance.chineseTeam,
      'created_at': instance.createdAt,
      'finished': instance.finished,
      'totalViews': instance.totalViews,
      'categories': instance.categories,
      'totalLikes': instance.totalLikes,
      'title': instance.title,
      'tags': instance.tags,
      '_id': instance.id,
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
