import 'package:json_annotation/json_annotation.dart';

part 'recommend_book_result.g.dart';


@JsonSerializable()
class RecommendBookResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  RecommendBookResult(this.code,this.message,this.data,);

  factory RecommendBookResult.fromJson(Map<String, dynamic> srcJson) => _$RecommendBookResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendBookResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'collections')
  List<Collections> collections;

  Data(this.collections,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Collections extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'comics')
  List<Comics> comics;

  Collections(this.title,this.comics,);

  factory Collections.fromJson(Map<String, dynamic> srcJson) => _$CollectionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectionsToJson(this);

}


@JsonSerializable()
class Comics extends Object {

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

  Comics(this.id,this.title,this.author,this.totalViews,this.totalLikes,this.pagesCount,this.epsCount,this.finished,this.categories,this.thumb,);

  factory Comics.fromJson(Map<String, dynamic> srcJson) => _$ComicsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ComicsToJson(this);

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


