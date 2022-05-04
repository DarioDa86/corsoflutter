import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;

  const CardPost({Key? key, required this.post }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        //post.owner.url == null ? "https://via.placeholder.com/150" : post.owner.url!
                        post.owner.url ?? "https://via.placeholder.com/150"
                    ),
                    radius: 30,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "${post.owner.firstName } ${post.owner.lastName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("Data 2020-05-24T14:53:17.598Z"),
                  ],
                ),
              ],
            ),
            Text(
              "adult Labrador retriever",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(
                "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg",
                width: MediaQuery.of(context).size.width - 16,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: Text("animal"),
                ),
                Chip(
                  label: Text("animal"),
                ),
              ],
            ),
            Row(
              children: [
                Text("18"),
                Icon(Icons.person),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
