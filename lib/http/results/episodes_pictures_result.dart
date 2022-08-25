import 'package:json_annotation/json_annotation.dart';

part 'episodes_pictures_result.g.dart';


@JsonSerializable()
class EpisodesPicturesResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  EpisodesPicturesResult(this.code,this.message,this.data,);

  factory EpisodesPicturesResult.fromJson(Map<String, dynamic> srcJson) => _$EpisodesPicturesResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EpisodesPicturesResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'pages')
  Pages pages;

  @JsonKey(name: 'ep')
  Ep ep;

  Data(this.pages,this.ep,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Pages extends Object {

  @JsonKey(name: 'docs')
  List<Docs> docs;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'pages')
  int pages;

  Pages(this.docs,this.total,this.limit,this.page,this.pages,);

  factory Pages.fromJson(Map<String, dynamic> srcJson) => _$PagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PagesToJson(this);

}


@JsonSerializable()
class Docs extends Object {

  @JsonKey(name: '_id')
  String id1;

  @JsonKey(name: 'media')
  Media media;

  @JsonKey(name: 'id')
  String id;

  Docs(this.id1,this.media,this.id,);

  factory Docs.fromJson(Map<String, dynamic> srcJson) => _$DocsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DocsToJson(this);

}


@JsonSerializable()
class Media extends Object {

  @JsonKey(name: 'originalName')
  String originalName;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'fileServer')
  String fileServer;

  Media(this.originalName,this.path,this.fileServer,);

  factory Media.fromJson(Map<String, dynamic> srcJson) => _$MediaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

}


@JsonSerializable()
class Ep extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'title')
  String title;

  Ep(this.id,this.title,);

  factory Ep.fromJson(Map<String, dynamic> srcJson) => _$EpFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EpToJson(this);

}


