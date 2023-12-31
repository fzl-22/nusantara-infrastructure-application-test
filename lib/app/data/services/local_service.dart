import 'package:get_storage/get_storage.dart';

class LocalService {
  static final _storage = GetStorage();

  static String? read({required String key}) {
    return _storage.read(key);
  }

  static void write({
    required String key,
    required String value,
  }) {
    _storage.write(key, value);
  }

  static void erase() {
    _storage.erase();
  }
}
