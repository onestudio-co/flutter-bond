import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class NewsAds extends StatelessWidget {
  const NewsAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: TalebSizes.h12),
      decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://cdn.searchenginejournal.com/wp-content/uploads/2020/01/responsive-display-ads-5e260c98e00db-1520x800.jpg',
            ),
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(TalebBorderRadius.r12))),
      child: SizedBox(
        height: TalebSizes.h80,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
