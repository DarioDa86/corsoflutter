import 'package:flutter/material.dart';
import 'package:social_app/components/card_post.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://04.cadwork.com/wp-content/uploads/logo-facebook.png",
                width: 100,
              ),
              const Divider(
                thickness: 4,
                color: Colors.blue,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    CardPost(
                      post: Post(
                        likes: 18,
                        link: "link",
                        image: "image",
                        publishDate: "publishDate",
                        id: "263",
                        text: "text",
                        owner: User(
                          id: "id",
                          firstName: "Matteo",
                          lastName: "Andersen",
                          email: "sara@sara.it",
                          url: "https://randomuser.me/api/portraits/med/women/5.jpg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
