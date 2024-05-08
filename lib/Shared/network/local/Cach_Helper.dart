import 'package:shared_preferences/shared_preferences.dart';

class CachHelper
{
  static late SharedPreferences sharedPreferences;

  //initialization on start of the application
  static Future<void> init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static int x = 0;


  // static Future<bool?> putBoolean({
  //   required String key,
  //   required bool value,
  // }) async
  // {
  //   return await sharedPreferences?.setBool(key, value);
  // }


  static dynamic getData({
    required String key,
  })
  {
    return sharedPreferences.get(key);
  }


  // Save All Data Type To SharedPreferences
  static Future<bool> saveData({
    required String key,
    required dynamic value,

  }) async
  {
    if (value is String)
    {
      return await sharedPreferences.setString(key, value);

    }
    else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static Future<bool> removeData({required String key,})async
  {
    return await sharedPreferences.remove(key);
  }


}
