import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


const String userBox = "userBox";
const String isFirstKey = 'isTheFirst';
const String myTokenKey = 'myToken';
const String myPIN = 'myPIN';

class AppCache {
  static Future <void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(userBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(userBox);

  static void haveFirstView(bool t) {
    if (isFirstKey == null) {
      return;
    }
    _userBox.put(isFirstKey, t);
  }

  static bool getIsFirst() {
    final bool data = _userBox.get(isFirstKey) ?? true;
    return data;
  }

  static String? get myToken {
    if (_userBox.containsKey(myTokenKey)) {
      return _userBox.get(myTokenKey);
    } else {
      return null;
    }
  }

  static void setMyToken(String type) async {
    await _userBox.put(myTokenKey, type);
  }

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}