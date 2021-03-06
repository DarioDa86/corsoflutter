import 'package:json_annotation/json_annotation.dart';
import 'package:social_app/models/user.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  final User owner;
  final String id;
  final String text;
  final String image;
  final int likes;
  final String link;
  final List<String>? tags;
  final String publishDate;


  const Post({
    required this.likes,
    required this.link,
    required this.image,
    this.tags,
    required this.publishDate,
    required this.id,
    required this.text,
    required this.owner,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}