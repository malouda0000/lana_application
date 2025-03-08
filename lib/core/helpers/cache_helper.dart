import 'dart:convert';

import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
    static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static SharedPreferences? _sharedPreferences;

  // String userToken='';
  // String userEmail ='';
  // String userLang ='';

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    // globalCachedUserToken = await getData(key: AppConstants.cachedUserToken);
    // globalCachedUserLang = await getData(key: AppConstants.cachedUserLang);
    // globalCachedArabicUserName =
    //     await getData(key: AppConstants.cachedArabicUserName);
    // globalCachedEnglishUserName =
    //     await getData(key: AppConstants.cachedEnglishUserName);
    // globalCachedUserID = await getData(key: AppConstants.cachedUserID);
    // globalCachedUserPhoneNum =
    //     await getData(key: AppConstants.cachedUserPhonNum);

    // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu :${globalUserToken}");

    // setToken();
    // getUser
  }


  // #### flutter secure storage #### //

final options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
// await storage.write(key: key, value: value, iOptions: options);

    // Secure Storage Methods
  static Future<void> saveSecureData({required String key, required String? value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> getSecureData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> removeSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> removeAllSecureData() async {
    await _secureStorage.deleteAll();
  }



//   static getUserData(){
// userToken = getData(key: AppSharedPrefrences.userToken) ?? '';
// userEmail = getData(key: AppSharedPrefrences.userEmail) ?? '';
// userLang = getData(key: AppSharedPrefrences.userLang) ?? '';
//    }
  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static Future<bool> saveData(
      {required String key, required String value}) async {
    return await _sharedPreferences!.setString(key, value);
  }

  static bool? getBoolean({required String key}) {
    return _sharedPreferences!.getBool(key) ?? false;
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return _sharedPreferences!.setString(key, value);
    if (value is bool) return _sharedPreferences!.setBool(key, value);
    if (value is int) return _sharedPreferences!.setInt(key, value);
    return _sharedPreferences!.setDouble(key, value);
  }

//     static Future<void > setLocalLocations({
//     required List<LocalLocationModel> newLocations ,
//     // required dynamic value,
//   }) async {

//      // Method to save a list of LocalLocationModel to shared preferences
//     List<Map<String, dynamic>>
//      locationsJsonList = newLocations.map((location) => location.toJson()).toList();
//     // await prefs.setStringList('locations', locationsJsonList);

//  _sharedPreferences!.setString(AppConstants.cachedUserLocations, locationsJsonList);

//     return _sharedPreferences!.setString(AppConstants.cachedUserLocations, newLocation);
//   }

// #### new functions to save and get user locations #### //

  // static const String _keyMap = 'myMap';
  static Future<bool> saveUserLocations(Map<String, String> map) async {
    // final prefs = await SharedPreferences.getInstance();
    return await _sharedPreferences!
        .setString(AppConstants.cachedUserLocations, map.toString());
  }

  static Future<Map<String, String>> getUserLocations() async {
    // final prefs = await SharedPreferences.getInstance();
    final jsonString =
        _sharedPreferences!.getString(AppConstants.cachedUserLocations);
    if (jsonString == null || jsonString.isEmpty) {
      return {};
    } else {
      final map = Map<String, String>.from(json.decode(jsonString));
      return map;
    }
  }

  static dynamic getData({
    required String key,
  }) {
    return _sharedPreferences?.get(key) ?? null;
  }

  static Future<bool> removeData(String key) {
    return _sharedPreferences!.remove(key);
  }

  static Future<bool> removeAllData() {
    return _sharedPreferences!.clear();
  }
}
