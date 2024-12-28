abstract class LocalRepository {
  const LocalRepository();

  Future<void> setAccessToken({
    required String? token,
  });

  String? getAccessToken();

  Future<void> eraseStorage();
}
