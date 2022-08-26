import 'package:json_annotation/json_annotation.dart';

part 'user_info_result.g.dart';


@JsonSerializable()
class UserInfoResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  UserInfoResult(this.code,this.message,this.data,);

  factory UserInfoResult.fromJson(Map<String, dynamic> srcJson) => _$UserInfoResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'user')
  User user;

  Data(this.user,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class User extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'slogan')
  String slogan;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'verified')
  bool verified;

  @JsonKey(name: 'exp')
  int exp;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'characters')
  List<dynamic> characters;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'avatar')
  Avatar avatar;

  @JsonKey(name: 'isPunched')
  bool isPunched;

  @JsonKey(name: 'character')
  String character;

  User(this.id,this.birthday,this.email,this.gender,this.name,this.slogan,this.title,this.verified,this.exp,this.level,this.characters,this.createdAt,this.avatar,this.isPunched,this.character,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class Avatar extends Object {

  @JsonKey(name: 'originalName')
  String originalName;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'fileServer')
  String fileServer;

  Avatar(this.originalName,this.path,this.fileServer,);

  factory Avatar.fromJson(Map<String, dynamic> srcJson) => _$AvatarFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);

}


