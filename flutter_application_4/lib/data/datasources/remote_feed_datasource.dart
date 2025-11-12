import '../../core/network/http_client.dart';

/// Simple remote data source with an in-memory cache.
class RemoteFeedDataSource {
  final HttpClient client;

  Map<String, dynamic>? _cachedFeedJson;
  Map<String, dynamic>? _cachedDetailsJson;

  RemoteFeedDataSource(this.client);

  /// Fetch feed from network and update cache on success.
  Future<Map<String, dynamic>> fetchFeed() async {
    final data = await client.getJson('v5/feed');
    _cachedFeedJson = data;
    return data;
  }

  /// Fetch details from network and update cache on success.
  Future<Map<String, dynamic>> fetchDetails() async {
    final data = await client.getJson('v5/feed/details');
    _cachedDetailsJson = data;
    return data;
  }

  /// Return cached feed JSON if available.
  Map<String, dynamic>? getCachedFeedJson() => _cachedFeedJson;

  /// Return cached details JSON if available.
  Map<String, dynamic>? getCachedDetailsJson() => _cachedDetailsJson;
}
