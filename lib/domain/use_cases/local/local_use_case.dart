import '../../repositories/local_repository.dart';

class LocalUseCase {
  const LocalUseCase({
    required this.localRepository,
  });

  final LocalRepository localRepository;

  Future<void> setAccessToken({
    required String? token,
  }) async {
    await localRepository.setAccessToken(
      token: token,
    );
  }

  String? getAccessToken() {
    return localRepository.getAccessToken();
  }

  Future<void> eraseStorage() async {
    await localRepository.eraseStorage();
  }
}
