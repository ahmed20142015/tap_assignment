import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_theme.dart';

final appThemeProvider = ChangeNotifierProvider((ref) {
  return ChangeAppTheme(ref);
});

class ChangeAppTheme extends ChangeNotifier {
  ThemeData? theme ;
  ProviderReference ref;

  ChangeAppTheme(this.ref) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      theme ??= ThemeController.darkTheme();
    }
    else {
      theme ??= ThemeController.lightTheme();
    }
  }

  void changeTheme(){
    print('changeTheme');
    if(theme!.brightness ==  Brightness.light) {
      print('darkTheme');
      theme = ThemeController.darkTheme();
    } else {
      print('lightTheme');
      theme = ThemeController.lightTheme();
    }
    notifyListeners();
  }

}