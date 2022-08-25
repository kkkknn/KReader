import 'package:json_annotation/json_annotation.dart';

part 'book_episodes_result.g.dart';


@JsonSerializable()
class BookEpisodesResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  BookEpisodesResult(this.code,this.message,this.data,);

  factory BookEpisodesResult.fromJson(Map<String, dynamic> srcJson) => _$BookEpisodesResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BookEpisodesResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'eps')
  Eps eps;

  Data(this.eps,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Eps extends Object {

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

  Eps(this.docs,this.total,this.limit,this.page,this.pages,);

  factory Eps.fromJson(Map<String, dynamic> srcJson) => _$EpsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EpsToJson(this);

}


@JsonSerializable()
class Docs extends Object {

  @JsonKey(name: '_id')
  String id1;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'id')
  String id;

  Docs(this.id1,this.title,this.order,this.updatedAt,this.id,);

  factory Docs.fromJson(Map<String, dynamic> srcJson) => _$DocsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DocsToJson(this);

}


