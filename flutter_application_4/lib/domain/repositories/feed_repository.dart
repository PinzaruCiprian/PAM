import '../entities/feed_entity.dart';
import '../entities/details_entity.dart';

abstract class FeedRepository {
  Future<FeedEntity> getFeed();
  Future<DetailsEntity> getDetails();
  // synchronous cached accessors - return null when no cached data is present
  FeedEntity? getCachedFeed();
  DetailsEntity? getCachedDetails();
}
