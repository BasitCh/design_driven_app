import 'package:shared_preferences/shared_preferences.dart';

///Usage:
/// - initialize the Helper to create an instance for SharedPreferences: [SharedPreferenceHelper.instance.init()];
class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();
  static final SharedPreferenceHelper _spSingleton =
      SharedPreferenceHelper._internal();

  static SharedPreferenceHelper get instance => _spSingleton;

  /// Needs to run SharedPreferenceHelper.instance.init() before.
  /// Made private to close modifications
  late SharedPreferences _sharedPrefInstance;
  void init() {
    SharedPreferences.getInstance()
        .then((value) => _sharedPrefInstance = value);
  }

  ///a key to check if it's app has ran before. Will be true if app has ran before.
  final String hasAppRanKey = 'hasAppRan';

  bool get hasAppRan => _sharedPrefInstance.getBool(hasAppRanKey) ?? false;
  set hasAppRan(bool? hasAppRan) {
    _sharedPrefInstance.setBool(hasAppRanKey, hasAppRan!);
  }
}
