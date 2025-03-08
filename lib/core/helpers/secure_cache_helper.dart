// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureCacheHelper {
//   static final FlutterSecureStorage _storage = FlutterSecureStorage();

//   static Future<void> saveData({required String key, required String value}) async {
//     await _storage.write(key: key, value: value);
//   }

//   static Future<String?> getData({required String key}) async {
//     return await _storage.read(key: key);
//   }

//   static Future<void> removeData(String key) async {
//     await _storage.delete(key: key);
//   }

//   static Future<void> removeAllData() async {
//     await _storage.deleteAll();
//   }

//   static Future<void> saveBoolean({required String key, required bool value}) async {
//     await _storage.write(key: key, value: value.toString());
//   }

//   static Future<bool> getBoolean({required String key}) async {
//     String? value = await _storage.read(key: key);
//     return value == 'true';
//   }

//   static Future<void> saveUserLocations(Map<String, String> map) async {
//     await _storage.write(key: 'user_locations', value: map.toString());
//   }

//   static Future<Map<String, String>> getUserLocations() async {
//     String? jsonString = await _storage.read(key: 'user_locations');
//     if (jsonString == null || jsonString.isEmpty) {
//       return {};
//     }
    
//     return Map<String, String>.from(
//       jsonString.substring(1, jsonString.length - 1) // Remove { }
//         .split(', ') // Split entries
//         .map((e) => e.split(': ')) // Split key-value pairs
//         .map((pair) => MapEntry(pair[0], pair[1])) // Convert to MapEntry
//         .toList() // Convert to List
//         .asMap()
//     );
//   }
// }
