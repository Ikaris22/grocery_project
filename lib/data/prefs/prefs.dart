import '../../main.dart';

class PrefKey {
  static const String isLogin = 'IS_LOGIN';
}



void setLogin(bool value) {
  prefs?.setBool(PrefKey.isLogin, value);
}

bool checkLogin() {
  return prefs?.getBool(PrefKey.isLogin) == true;
}