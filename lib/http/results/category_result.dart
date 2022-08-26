import 'package:json_annotation/json_annotation.dart';

part 'category_result.g.dart';


@JsonSerializable()
class CategoryResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  CategoryResult(this.code,this.message,this.data,);

  factory CategoryResult.fromJson(Map<String, dynamic> srcJson) => _$CategoryResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'categories')
  List<Categories> categories;

  Data(this.categories,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Categories extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'thumb')
  Thumb thumb;

  @JsonKey(name: 'isWeb')
  bool isWeb;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'link')
  String link;

  Categories(this.title,this.thumb,this.isWeb,this.active,this.link,);

  factory Categories.fromJson(Map<String, dynamic> srcJson) => _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

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


