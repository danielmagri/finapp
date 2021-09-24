import 'package:injectable/injectable.dart';
import 'core/shared_pref_handler.dart';

@singleton
class SharedPref extends SharedPrefHandler {
  @factoryMethod
  static Future<SharedPref> initialize() async {
    var instance = SharedPref();
    await instance.init();
    return instance;
  }

  // Theme
  String get theme => getString("THEME") ?? "";
  set theme(String value) => saveString("THEME", value);
}
