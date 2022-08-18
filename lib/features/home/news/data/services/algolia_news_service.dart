import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/integrations/algolia.dart';

class AlgoliaNewsService {
  Algolia? algoliaService = AlgoliaInitialization.algoliaObject;

  AlgoliaNewsService({this.algoliaService});

  // Future<List<News>> getAllNews() async {
  //   final AlgoliaIndexReference index =
  //       algoliaService!.instance.index('news_index');
  //   try {
  //     final AlgoliaQuerySnapshot resultsObjects =
  //         await index.setHitsPerPage(25).getObjects();
  //     final List<dynamic> results = await resultsObjects.toMap()['hits'];
  //     return results
  //         .map((dynamic element) =>
  //             News.fromJson(element as Map<String, dynamic>))
  //         .toList();
  //   } catch (error) {
  //     throw ServerException.fromResponse(error.toString());
  //   }
  // }

  Future<List<News>> searchNews(String text) async {
    final AlgoliaIndexReference index =
        algoliaService!.instance.index('news_index');
    List<dynamic>? results;
    try {
      await index.query(text).getObjects().then((AlgoliaQuerySnapshot value) {
        log(value.toMap().toString(), name: 'algolia news searvice');
        results = value.toMap()['hits'];
      });
      return results!
          .where((dynamic element) => element != null)
          .whereType<Map<String, dynamic>>()
          .map((dynamic element) {
        return News.fromJson(element as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      throw ServerException.fromResponse(error.toString());
    }
  }
}
