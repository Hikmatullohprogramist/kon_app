// ignore_for_file: constant_identifier_names


// class PrefUtils {
//   late SharedPreferences _singleton;

//   static const PREF_TOKEN = "token";

//   SharedPreferences getInstanse() {
//     return _singleton;
//   }

//   Future<bool> initInstane() async {
//     _singleton = await SharedPreferences.getInstance();
//     return true;
//   }

//   String getToken() {
//     return _singleton.getString(PREF_TOKEN) ?? "";
//   }

//   Future<bool> setToken(String value) async {
//     return _singleton.setString(PREF_TOKEN, value);
//   }

//   Future<void> clearAll() async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.clear();
//     return;
//   }
// }
