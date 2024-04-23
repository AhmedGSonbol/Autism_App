import 'package:shared_preferences/shared_preferences.dart';

class CachHelper
{
  static SharedPreferences? sharedPreferences;

  static int? lol;
  //initialization on start of the application
  static Future init() async
  {
    print('999');
    sharedPreferences = await SharedPreferences.getInstance();
    lol = 5;
    print('dine');
  }


  // static Future<bool?> putBoolean({
  //   required String key,
  //   required bool value,
  // }) async
  // {
  //   return await sharedPreferences?.setBool(key, value);
  // }


  static  getData({
    required String key,
  })
  {
    return sharedPreferences?.get(key);
  }


  // Save All Data Type To SharedPreferences
  static Future<bool?> saveData({
    required String key,
    required dynamic value,

  }) async
  {
    print(value);
    if (value is String) {
      return await sharedPreferences?.setString(key, value);
    }
    else if (value is bool) {
      return await sharedPreferences?.setBool(key, value);
    }
    else if (value is int) {
      return await sharedPreferences?.setInt(key, value);
    }
    else {
      return await sharedPreferences?.setDouble(key, value);
    }
  }

  static Future<bool?> removeData({required String key,})async
  {
    return await sharedPreferences?.remove(key);
  }


}
