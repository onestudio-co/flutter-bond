import 'dart:convert';
import 'package:bond/core/integration/dynamic_links_service.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/features/post_details/presentation/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.author.name),
        actions: [
          ShareButton(onShare: () => _sharePost()),
        ],
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: Hero(
          tag: post.urls.regular,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              post.urls.smallS3,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _sharePost() async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(post.toJsonString());
    Share.share(
        await sl<DynamicLinksService>().createDynamicLink('post', encoded));
  }
}
