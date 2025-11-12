import 'core/network/http_client.dart';
import 'data/datasources/remote_feed_datasource.dart';
import 'data/repositories/feed_repository_impl.dart';
import 'domain/usecases/get_feed.dart';
import 'domain/usecases/get_details.dart';

class InjectionContainer {
  static final InjectionContainer _instance = InjectionContainer._internal();
  factory InjectionContainer() => _instance;
  InjectionContainer._internal() {
    _httpClient = HttpClient(baseUrl: 'https://test-api-jlbn.onrender.com');
    _remote = RemoteFeedDataSource(_httpClient);
    _repo = FeedRepositoryImpl(_remote);
    getFeed = GetFeed(_repo);
    getDetails = GetDetails(_repo);
  }

  late final HttpClient _httpClient;
  late final RemoteFeedDataSource _remote;
  late final FeedRepositoryImpl _repo;

  late final GetFeed getFeed;
  late final GetDetails getDetails;
}
