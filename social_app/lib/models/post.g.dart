// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      likes: json['likes'] as int,
      link: json['link'] as String,
      image: json['image'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishDate: json['publishDate'] as String,
      id: json['id'] as String,
      text: json['text'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'owner': instance.owner.toJson(),
      'id': instance.id,
      'text': instance.text,
      'image': instance.image,
      'likes': instance.likes,
      'link': instance.link,
      'tags': instance.tags,
      'publishDate': instance.publishDate,
    };
