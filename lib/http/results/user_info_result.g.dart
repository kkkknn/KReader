// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResult _$UserInfoResultFromJson(Map<String, dynamic> json) =>
    UserInfoResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoResultToJson(UserInfoResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['_id'] as String,
      json['birthday'] as String,
      json['email'] as String,
      json['gender'] as String,
      json['name'] as String,
      json['slogan'] as String,
      json['title'] as String,
      json['verified'] as bool,
      json['exp'] as int,
      json['level'] as int,
      json['characters'] as List<dynamic>,
      json['created_at'] as String,
      Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      json['isPunched'] as bool,
      json['character'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'birthday': instance.birthday,
      'email': instance.email,
      'gender': instance.gender,
      'name': instance.name,
      'slogan': instance.slogan,
      'title': instance.title,
      'verified': instance.verified,
      'exp': instance.exp,
      'level': instance.level,
      'characters': instance.characters,
      'created_at': instance.createdAt,
      'avatar': instance.avatar,
      'isPunched': instance.isPunched,
      'character': instance.character,
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
