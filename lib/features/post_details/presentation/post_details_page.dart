import 'package:bond/features/post/data/models/post.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.author.name),
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: Hero(
          tag: post.urls.regular,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              post.urls.smallS3,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
