import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';


@JsonSerializable()
class SearchResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  SearchResult(this.code,this.message,this.data,);

  factory SearchResult.fromJson(Map<String, dynamic> srcJson) => _$SearchResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);

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

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'pages')
  int pages;

  @JsonKey(name: 'docs')
  List<Docs> docs;

  @JsonKey(name: 'limit')
  int limit;

  Comics(this.total,this.page,this.pages,this.docs,this.limit,);

  factory Comics.fromJson(Map<String, dynamic> srcJson) => _$ComicsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ComicsToJson(this);

}


@JsonSerializable()
class Docs extends Object {

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'thumb')
  Thumb thumb;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'chineseTeam')
  String chineseTeam;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'finished')
  bool finished;

  @JsonKey(name: 'totalViews')
  int totalViews;

  @JsonKey(name: 'categories')
  List<String> categories;

  @JsonKey(name: 'totalLikes')
  int totalLikes;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'likesCount')
  int likesCount;

  Docs(this.updatedAt,this.thumb,this.author,this.description,this.chineseTeam,this.createdAt,this.finished,this.totalViews,this.categories,this.totalLikes,this.title,this.tags,this.id,this.likesCount,);

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


