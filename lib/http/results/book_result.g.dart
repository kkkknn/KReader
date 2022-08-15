// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResult _$BookResultFromJson(Map<String, dynamic> json) => BookResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookResultToJson(BookResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Comic.fromJson(json['comic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'comic': instance.comic,
    };

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      json['_id'] as String,
      _creator.fromJson(json['_creator'] as Map<String, dynamic>),
      json['title'] as String,
      json['description'] as String,
      Thumb.fromJson(json['thumb'] as Map<String, dynamic>),
      json['author'] as String,
      json['chineseTeam'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['pagesCount'] as int,
      json['epsCount'] as int,
      json['finished'] as bool,
      json['updated_at'] as String,
      json['created_at'] as String,
      json['allowDownload'] as bool,
      json['allowComment'] as bool,
      json['totalLikes'] as int,
      json['totalViews'] as int,
      json['totalComments'] as int,
      json['viewsCount'] as int,
      json['likesCount'] as int,
      json['commentsCount'] as int,
      json['isFavourite'] as bool,
      json['isLiked'] as bool,
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      '_id': instance.id,
      '_creator': instance.creator,
      'title': instance.title,
      'description': instance.description,
      'thumb': instance.thumb,
      'author': instance.author,
      'chineseTeam': instance.chineseTeam,
      'categories': instance.categories,
      'tags': instance.tags,
      'pagesCount': instance.pagesCount,
      'epsCount': instance.epsCount,
      'finished': instance.finished,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'allowDownload': instance.allowDownload,
      'allowComment': instance.allowComment,
      'totalLikes': instance.totalLikes,
      'totalViews': instance.totalViews,
      'totalComments': instance.totalComments,
      'viewsCount': instance.viewsCount,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'isFavourite': instance.isFavourite,
      'isLiked': instance.isLiked,
    };

_creator _$creatorFromJson(Map<String, dynamic> json) => _creator(
      json['_id'] as String,
      json['gender'] as String,
      json['name'] as String,
      json['title'] as String,
      json['verified'] as bool,
      json['exp'] as int,
      json['level'] as int,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      json['role'] as String,
      Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      json['slogan'] as String,
    );

Map<String, dynamic> _$creatorToJson(_creator instance) => <String, dynamic>{
      '_id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'title': instance.title,
      'verified': instance.verified,
      'exp': instance.exp,
      'level': instance.level,
      'characters': instance.characters,
      'role': instance.role,
      'avatar': instance.avatar,
      'slogan': instance.slogan,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['originalName'] as String,
      json['path'] as String,
      json['fileServer'] as String,
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'originalName': instance.originalName,
      'path': instance.path,
      'fileServer': instance.fileServer,
    };

Thumb _$ThumbFromJson(Map<String, dynamic> json) => Thumb(
      json['fileServer'] as String,
      json['path'] as String,
      json['originalName'] as String,
    );

Map<String, dynamic> _$ThumbToJson(Thumb instance) => <String, dynamic>{
      'fileServer': instance.fileServer,
      'path': instance.path,
      'originalName': instance.originalName,
    };
