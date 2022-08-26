import 'package:json_annotation/json_annotation.dart';

part 'key_words_result.g.dart';


@JsonSerializable()
class KeyWordsResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  KeyWordsResult(this.code,this.message,this.data,);

  factory KeyWordsResult.fromJson(Map<String, dynamic> srcJson) => _$KeyWordsResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KeyWordsResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'keywords')
  List<String> keywords;

  Data(this.keywords,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


