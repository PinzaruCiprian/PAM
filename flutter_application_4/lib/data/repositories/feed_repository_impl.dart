import '../../domain/entities/feed_entity.dart';
import '../../domain/entities/details_entity.dart';
import '../../domain/repositories/feed_repository.dart';
import '../datasources/remote_feed_datasource.dart';
import '../models/feed_model.dart';
import '../models/details_model.dart';

class FeedRepositoryImpl implements FeedRepository {
  final RemoteFeedDataSource remote;

  FeedRepositoryImpl(this.remote);

  @override
  Future<FeedEntity> getFeed() async {
    try {
      final json = await remote.fetchFeed();
      final model = FeedModel.fromJson(json);
      return FeedEntity(user: model.user, actions: model.actions, specialities: model.specialities, specialists: model.specialists);
    } catch (e) {
      // On network error, fall back to cached JSON if available
      final cached = remote.getCachedFeedJson();
      if (cached != null) {
        final model = FeedModel.fromJson(cached);
        return FeedEntity(user: model.user, actions: model.actions, specialities: model.specialities, specialists: model.specialists);
      }
      rethrow;
    }
  }

  @override
  Future<DetailsEntity> getDetails() async {
    try {
      final json = await remote.fetchDetails();
      final model = DetailsModel.fromJson(json);
      return DetailsEntity(doctor: model.doctor, appointment: model.appointment, timing: model.timing, locations: model.locations, tabs: model.tabs);
    } catch (e) {
      final cached = remote.getCachedDetailsJson();
      if (cached != null) {
        final model = DetailsModel.fromJson(cached);
        return DetailsEntity(doctor: model.doctor, appointment: model.appointment, timing: model.timing, locations: model.locations, tabs: model.tabs);
      }
      rethrow;
    }
  }

  @override
  FeedEntity? getCachedFeed() {
    final cached = remote.getCachedFeedJson();
    if (cached == null) return null;
    final model = FeedModel.fromJson(cached);
    return FeedEntity(user: model.user, actions: model.actions, specialities: model.specialities, specialists: model.specialists);
  }

  @override
  DetailsEntity? getCachedDetails() {
    final cached = remote.getCachedDetailsJson();
    if (cached == null) return null;
    final model = DetailsModel.fromJson(cached);
    return DetailsEntity(doctor: model.doctor, appointment: model.appointment, timing: model.timing, locations: model.locations, tabs: model.tabs);
  }
}
