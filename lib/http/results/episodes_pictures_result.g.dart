// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_pictures_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesPicturesResult _$EpisodesPicturesResultFromJson(
        Map<String, dynamic> json) =>
    EpisodesPicturesResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodesPicturesResultToJson(
        EpisodesPicturesResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Pages.fromJson(json['pages'] as Map<String, dynamic>),
      Ep.fromJson(json['ep'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'pages': instance.pages,
      'ep': instance.ep,
    };

Pages _$PagesFromJson(Map<String, dynamic> json) => Pages(
      (json['docs'] as List<dynamic>)
          .map((e) => Docs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['limit'] as int,
      json['page'] as int,
      json['pages'] as int,
    );

Map<String, dynamic> _$PagesToJson(Pages instance) => <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };

Docs _$DocsFromJson(Map<String, dynamic> json) => Docs(
      json['_id'] as String,
      Media.fromJson(json['media'] as Map<String, dynamic>),
      json['id'] as String,
    );

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
      '_id': instance.id1,
      'media': instance.media,
      'id': instance.id,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      json['originalName'] as String,
      json['path'] as String,
      json['fileServer'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'originalName': instance.originalName,
      'path': instance.path,
      'fileServer': instance.fileServer,
    };

Ep _$EpFromJson(Map<String, dynamic> json) => Ep(
      json['_id'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$EpToJson(Ep instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };
