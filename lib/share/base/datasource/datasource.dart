typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class DataSource<T> {
  Future<T> call({FromJson<T>? fromJson, Map<String, dynamic>? param, dynamic data});
}