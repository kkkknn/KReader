import 'package:json_annotation/json_annotation.dart';

part 'punch_in_result.g.dart';


@JsonSerializable()
class PunchInResult extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  PunchInResult(this.code,this.message,this.data,);

  factory PunchInResult.fromJson(Map<String, dynamic> srcJson) => _$PunchInResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PunchInResultToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'res')
  Res res;

  Data(this.res,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Res extends Object {

  @JsonKey(name: 'status')
  String status;

  Res(this.status,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}


