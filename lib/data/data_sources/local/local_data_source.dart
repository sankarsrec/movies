import '../../core/local_storage.dart';

abstract class LocalDataSource {
  const LocalDataSource();

  Future<void> setAccessToken({
    required String? token,
  });

  String? getAccessToken();

  Future<void> eraseStorage();
}

class LocalDataSourceImpl extends LocalDataSource {
  const LocalDataSourceImpl({
    required this.localStorage,
  });

  final LocalStorage localStorage;

  @override
  Future<void> setAccessToken({
    required String? token,
  }) async {
    await localStorage.saveToStorage(
      LocalStorageConstants.accessToken,
      token,
    );
  }

  @override
  String? getAccessToken() {
    final response = localStorage.readFromStorage(
      LocalStorageConstants.accessToken,
    );
    return response;
  }

  @override
  Future<void> eraseStorage() async {
    await localStorage.eraseStorage();
  }
}
