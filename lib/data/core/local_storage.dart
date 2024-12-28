import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

part 'local_storage_constants.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();

  Future<void> initStorage() async {
    debugPrint('INIT STORAGE');
    await _getStorage.initStorage;
  }

  Future<void> saveToStorage(String key, dynamic value) async {
    debugPrint('Save $key - $value');
    await _getStorage.write(key, value);
  }

  dynamic readFromStorage(String key) {
    dynamic readData = _getStorage.read(key);
    debugPrint('Read $key - $readData');
    return readData;
  }

  Future<void> eraseStorage() async {
    debugPrint('Erase Storage');
    await _getStorage.erase();
  }
}
