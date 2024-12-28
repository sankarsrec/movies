import '../../domain/repositories/local_repository.dart';
import '../data_sources/local/local_data_source.dart';

class LocalRepositoryImpl extends LocalRepository {
  const LocalRepositoryImpl({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

  @override
  Future<void> setAccessToken({
    required String? token,
  }) async {
    await localDataSource.setAccessToken(
      token: token,
    );
  }

  @override
  String? getAccessToken() {
    return localDataSource.getAccessToken();
  }

  @override
  Future<void> eraseStorage() {
    return localDataSource.eraseStorage();
  }
}
