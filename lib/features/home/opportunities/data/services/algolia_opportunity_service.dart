import 'package:algolia/algolia.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/integrations/algolia.dart';

class AlgoliaOpportunityService {
  Algolia? algoliaService = AlgoliaInitialization.algoliaObject;

  AlgoliaOpportunityService({this.algoliaService});

  Future<List<Opportunity>> getAllNews() async {
    final AlgoliaIndexReference index =
        algoliaService!.instance.index('opportuity_index');
    try {
      final AlgoliaQuerySnapshot resultsObjects =
          await index.setHitsPerPage(25).getObjects();
      final List<dynamic> results = await resultsObjects.toMap()['hits'];
      return results
          .map((dynamic element) =>
              Opportunity.fromJson(element as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw ServerException.fromResponse(error.toString());
    }
  }

  Future<List<Opportunity>> searchNews(String text) async {
    final AlgoliaIndexReference index =
        algoliaService!.instance.index('opportuity_index');
    List<dynamic>? results;
    try {
      await index.query(text).getObjects().then((AlgoliaQuerySnapshot value) {
        results = value.toMap()['hits'];
      });
      return results!
          .where((element) => element != null)
          .whereType<Map<String, dynamic>>()
          .map((dynamic element) {
        return Opportunity.fromJson(element as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      throw ServerException.fromResponse(error.toString());
    }
  }
}

//  if (element != null && element is Map) {
//               return News.fromJson(element as Map<String, dynamic>);
//             }