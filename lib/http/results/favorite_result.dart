import 'package:json_annotation/json_annotation.dart';

part 'favorite_result.g.dart';


@JsonSerializable()
class FavoriteResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  FavoriteResult(this.code,this.message,this.data,);

  factory FavoriteResult.fromJson(Map<String, dynamic> srcJson) => _$FavoriteResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FavoriteResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'comics')
  Comics comics;

  Data(this.comics,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Comics extends Object {

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'docs')
  List<Docs> docs;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'limit')
  int limit;

  Comics(this.pages,this.total,this.docs,this.page,this.limit,);

  factory Comics.fromJson(Map<String, dynamic> srcJson) => _$ComicsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ComicsToJson(this);

}


@JsonSerializable()
class Docs extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'totalViews')
  int totalViews;

  @JsonKey(name: 'totalLikes')
  int totalLikes;

  @JsonKey(name: 'pagesCount')
  int pagesCount;

  @JsonKey(name: 'epsCount')
  int epsCount;

  @JsonKey(name: 'finished')
  bool finished;

  @JsonKey(name: 'categories')
  List<String> categories;

  @JsonKey(name: 'thumb')
  Thumb thumb;

  @JsonKey(name: 'likesCount')
  int likesCount;

  Docs(this.id,this.title,this.author,this.totalViews,this.totalLikes,this.pagesCount,this.epsCount,this.finished,this.categories,this.thumb,this.likesCount,);

  factory Docs.fromJson(Map<String, dynamic> srcJson) => _$DocsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DocsToJson(this);

}


@JsonSerializable()
class Thumb extends Object {

  @JsonKey(name: 'originalName')
  String originalName;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'fileServer')
  String fileServer;

  Thumb(this.originalName,this.path,this.fileServer,);

  factory Thumb.fromJson(Map<String, dynamic> srcJson) => _$ThumbFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ThumbToJson(this);

}


