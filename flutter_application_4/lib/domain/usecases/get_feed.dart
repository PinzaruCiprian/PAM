import '../entities/feed_entity.dart';
import '../repositories/feed_repository.dart';

class GetFeed {
  final FeedRepository repository;
  GetFeed(this.repository);

  Future<FeedEntity> call() async {
    return await repository.getFeed();
  }

  /// Return cached feed synchronously if available.
  FeedEntity? getCached() => repository.getCachedFeed();
}
