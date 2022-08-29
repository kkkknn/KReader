import 'package:json_annotation/json_annotation.dart';

part 'like_or_favorite_result.g.dart';


@JsonSerializable()
class LikeOrFavoriteResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  LikeOrFavoriteResult(this.code,this.message,this.data,);

  factory LikeOrFavoriteResult.fromJson(Map<String, dynamic> srcJson) => _$LikeOrFavoriteResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LikeOrFavoriteResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'action')
  String action;

  Data(this.action,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


