// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_episodes_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookEpisodesResult _$BookEpisodesResultFromJson(Map<String, dynamic> json) =>
    BookEpisodesResult(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookEpisodesResultToJson(BookEpisodesResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Eps.fromJson(json['eps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'eps': instance.eps,
    };

Eps _$EpsFromJson(Map<String, dynamic> json) => Eps(
      (json['docs'] as List<dynamic>)
          .map((e) => Docs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['limit'] as int,
      json['page'] as int,
      json['pages'] as int,
    );

Map<String, dynamic> _$EpsToJson(Eps instance) => <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };

Docs _$DocsFromJson(Map<String, dynamic> json) => Docs(
      json['_id'] as String,
      json['title'] as String,
      json['order'] as int,
      json['updated_at'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
      '_id': instance.id1,
      'title': instance.title,
      'order': instance.order,
      'updated_at': instance.updatedAt,
      'id': instance.id,
    };
