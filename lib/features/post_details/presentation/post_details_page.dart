import 'package:bond/core/widgets/app_image.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/features/post_details/presentation/widgets/share_button.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.author.name),
        actions: [
          ShareButton(
            postImageUrl: post.urls.full, // Pass the post image URL
          )
        ],
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: Hero(
          tag: post.uuid,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppImage(
              imageUrl: post.urls.full,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
