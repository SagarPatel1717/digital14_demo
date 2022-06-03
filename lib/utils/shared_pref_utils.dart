import 'package:shared_preferences/shared_preferences.dart';

import '../constant/shared_pref_constants.dart';
import '../di/injector.dart';

class SharedPrefUtils {
  static SharedPreferences _pre = sl<SharedPreferences>();

  static Future<bool> setClientId({required String? clientId}) {
    return _pre.setString(SharedPrefConstants.clientId, clientId ?? '');
  }

  static String? getClientId() {
    return _pre.getString(SharedPrefConstants.clientId);
  }

  static Future<void> clearSharedPref() async {
    await _pre.remove(SharedPrefConstants.clientId);
  }
}
