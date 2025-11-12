import '../entities/details_entity.dart';
import '../repositories/feed_repository.dart';

class GetDetails {
  final FeedRepository repository;
  GetDetails(this.repository);

  Future<DetailsEntity> call() async {
    return await repository.getDetails();
  }

  DetailsEntity? getCached() => repository.getCachedDetails();
}
