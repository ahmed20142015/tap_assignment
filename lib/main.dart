import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'data/network/api_client.dart';
import 'data/repository/api_repository.dart';
import 'data/repository/mock_repository.dart';
import 'data/sharedpref/shared_preference_helper.dart';
import 'features/pages/view_model/theme_view_model.dart';


var sharedPreferences ;
var sharedPreferencesHelper;

final mockRepository = Provider((ref) => MockRepository());


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences =  await SharedPreferences.getInstance();
  sharedPreferencesHelper = Provider((ref) => SharedPreferencesHelper(sharedPreferences));
  runApp(
    const ProviderScope(
      // overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final appTheme = watch(appThemeProvider).theme;

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return MaterialApp(
          title: 'Task',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: AppRoutes.main,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );

  }
}
