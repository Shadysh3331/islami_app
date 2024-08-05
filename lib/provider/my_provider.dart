import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{
  ThemeMode mode=ThemeMode.light;
  getTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark=prefs.getBool('isDark');
    if(isDark!=null){
      if(isDark==true){
        mode=ThemeMode.dark;
      }else{
        mode=ThemeMode.light;
      }
      notifyListeners();
    }

  }

  changeTheme(ThemeMode themeMode)async{
    mode=themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', mode==ThemeMode.dark);
    notifyListeners();
  }
}