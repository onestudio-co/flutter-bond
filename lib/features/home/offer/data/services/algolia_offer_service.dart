import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/integrations/algolia.dart';

class AlgoliaOfferService {
  Algolia? algoliaService = AlgoliaInitialization.algoliaObject;

  AlgoliaOfferService({this.algoliaService});

  // Future<List<Offer>> getAllOffer() async {
  //   final AlgoliaIndexReference index =
  //       algoliaService!.instance.index('offer_index');
  //   try {
  //     final AlgoliaQuerySnapshot resultsObjects =
  //         await index.setHitsPerPage(25).getObjects();
  //     final List<dynamic> results = await resultsObjects.toMap()['hits'];
  //     return results
  //         .map((dynamic element) =>
  //             Offer.fromJson(element as Map<String, dynamic>))
  //         .toList();
  //   } catch (error) {
  //     throw ServerException.fromResponse(error.toString());
  //   }
  // }

  Future<List<Offer>> searchOffer(String text) async {
    final AlgoliaIndexReference index =
        algoliaService!.instance.index('offer_index');
    List<dynamic>? results;
    try {
      await index.query(text).getObjects().then((AlgoliaQuerySnapshot value) {
        log(value.toMap().toString(), name: 'algolia offer searvice');
        results = value.toMap()['hits'];
      });
      return results!
          .where((dynamic element) => element != null)
          .whereType<Map<String, dynamic>>()
          .map((dynamic element) {
        return Offer.fromJson(element as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      throw ServerException.fromResponse(error.toString());
    }
  }
}
