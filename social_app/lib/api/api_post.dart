import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';

class ApiPost{

  static String get baseUrl => "https://dummyapi.io/data/v1";

  //Ritorna lista di tutti i post
  static Future<PostResponse> getPostList({int page = 0, int limit = 20}) async{
    final response = await http.get(Uri.parse("$baseUrl/post/?page=$page&limit=$limit"), headers: {'app-id': '626fc935e000f620bdf05f17'});

    if (response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Errore nel ricevere i post ${response.body}");
  }

  //ritorna il post con l'id specificato
  static Future<Post> getPostById(String id) async{
    final response = await http.get(Uri.parse("$baseUrl/post/$id"), headers: {'app-id': '626fc935e000f620bdf05f17'});

    if (response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception("Errore nel trovare il post ${response.body}");
  }

  //ritorna tutti i post di un dato utente
  static Future<PostResponse> getPostByUser(String id, {int page = 0, int limit = 20}) async{
    final response = await http.get(Uri.parse("$baseUrl/user/$id/post/?page=$page&limit=$limit"), headers: {'app-id': '626fc935e000f620bdf05f17'});

    if (response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Errore nel ricevere i post ${response.body}");
  }

  //ritorna tutti i post con un determinato tag
  static Future<PostResponse> getPostByTag(String id, {int page = 0, int limit = 20}) async{
    final response = await http.get(Uri.parse("$baseUrl/tag/$id/post/?page=$page&limit=$limit"), headers: {'app-id': '626fc935e000f620bdf05f17'});

    if (response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Errore nel ricevere i post ${response.body}");
  }
}