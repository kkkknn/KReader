import 'package:json_annotation/json_annotation.dart';

part 'book_result.g.dart';


@JsonSerializable()
class BookResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  BookResult(this.code,this.message,this.data,);

  factory BookResult.fromJson(Map<String, dynamic> srcJson) => _$BookResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'comic')
  Comic comic;

  Data(this.comic,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Comic extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: '_creator')
  _creator creator;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'thumb')
  Thumb thumb;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chineseTeam')
  String chineseTeam;

  @JsonKey(name: 'categories')
  List<String> categories;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'pagesCount')
  int pagesCount;

  @JsonKey(name: 'epsCount')
  int epsCount;

  @JsonKey(name: 'finished')
  bool finished;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'allowDownload')
  bool allowDownload;

  @JsonKey(name: 'allowComment')
  bool allowComment;

  @JsonKey(name: 'totalLikes')
  int totalLikes;

  @JsonKey(name: 'totalViews')
  int totalViews;

  @JsonKey(name: 'totalComments')
  int totalComments;

  @JsonKey(name: 'viewsCount')
  int viewsCount;

  @JsonKey(name: 'likesCount')
  int likesCount;

  @JsonKey(name: 'commentsCount')
  int commentsCount;

  @JsonKey(name: 'isFavourite')
  bool isFavourite;

  @JsonKey(name: 'isLiked')
  bool isLiked;

  Comic(this.id,this.creator,this.title,this.description,this.thumb,this.author,this.chineseTeam,this.categories,this.tags,this.pagesCount,this.epsCount,this.finished,this.updatedAt,this.createdAt,this.allowDownload,this.allowComment,this.totalLikes,this.totalViews,this.totalComments,this.viewsCount,this.likesCount,this.commentsCount,this.isFavourite,this.isLiked,);

  factory Comic.fromJson(Map<String, dynamic> srcJson) => _$ComicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ComicToJson(this);

}


@JsonSerializable()
class _creator extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'verified')
  bool verified;

  @JsonKey(name: 'exp')
  int exp;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'characters')
  List<String> characters;

  @JsonKey(name: 'role')
  String role;

  @JsonKey(name: 'avatar')
  Avatar avatar;

  @JsonKey(name: 'slogan')
  String slogan;

  _creator(this.id,this.gender,this.name,this.title,this.verified,this.exp,this.level,this.characters,this.role,this.avatar,this.slogan,);

  factory _creator.fromJson(Map<String, dynamic> srcJson) => _$creatorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$creatorToJson(this);

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


@JsonSerializable()
class Thumb extends Object {

  @JsonKey(name: 'fileServer')
  String fileServer;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'originalName')
  String originalName;

  Thumb(this.fileServer,this.path,this.originalName,);

  factory Thumb.fromJson(Map<String, dynamic> srcJson) => _$ThumbFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ThumbToJson(this);

}


