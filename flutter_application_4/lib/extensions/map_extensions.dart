extension MapExtensions on Map<String, dynamic> {
  T? get<T>(String key) {
    final value = this[key];
    if (value is T) {
      return value;
    }
    return null;
  }

  T getOrDefault<T>(String key, T defaultValue) {
    final value = this[key];
    if (value is T) {
      return value;
    }
    return defaultValue;
  }

  Map<String, dynamic>? getMap(String key) => get<Map<String, dynamic>>(key);
  List<dynamic>? getList(String key) => get<List<dynamic>>(key);
  String? getString(String key) => get<String>(key);
  int? getInt(String key) => get<int>(key);
  double? getDouble(String key) => get<double>(key);
  bool? getBool(String key) => get<bool>(key);
}