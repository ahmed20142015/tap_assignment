import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class ThemeController {
  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();

    TextTheme _buildTextThemeLight(TextTheme base) {
      return base.copyWith(
        headline1: base.headline1!.copyWith(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.bold),
        headline2: base.headline2!.copyWith(color: AppColor.black,fontSize: 14,fontWeight: FontWeight.w300),

        headline5: base.headline5!.copyWith(fontWeight: FontWeight.bold, color: AppColor.black),
        subtitle1: base.subtitle1!.copyWith(color: AppColor.black),
        subtitle2: base.subtitle2!
            .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
        bodyText1: base.bodyText1!.copyWith(color: AppColor.white),
        bodyText2: base.bodyText2!.copyWith(color: AppColor.blackLight),
        caption: base.caption!.copyWith(color: AppColor.blackLight),
      );
    }

    return base.copyWith(
        primaryColor: Colors.red,
        indicatorColor: Colors.white,
        dividerColor: AppColor.lightDivider,
        scaffoldBackgroundColor: AppColor.whiteLightest,
        errorColor: AppColor.lightError,
        cardColor: AppColor.white,
        appBarTheme: base.appBarTheme.copyWith(
            color: AppColor.whiteLightest,
            elevation: 0,

            titleTextStyle: base.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            iconTheme: const IconThemeData(color: AppColor.black),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor:  AppColor.whiteLightest,
          ),
        ),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: AppColor.black),
        dialogTheme: base.dialogTheme.copyWith(
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
            overlayColor:
                MaterialStateProperty.all(ThemeData.dark().splashColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(base.splashColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: AppColor.blackLight)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.29),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
        ),
        inputDecorationTheme: base.inputDecorationTheme.copyWith(
          border: InputBorder.none,
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFF1F1F1),
          hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.blackLight),
        ),
        cardTheme: CardTheme(
          color: const Color(0xfffcfcfc),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          elevation: 10,
          shadowColor: const Color(0xff000000).withOpacity(0.25),
        ),
        textTheme: _buildTextThemeLight(base.textTheme));
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();

    TextTheme _buildTextThemeDark(TextTheme base) {
      return base.copyWith(
        headline1: base.headline1!.copyWith(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.w600),
        headline2: base.headline2!.copyWith(color: AppColor.white,fontSize: 14,fontWeight: FontWeight.w300),

        headline5: base.headline5!.copyWith(fontWeight: FontWeight.bold),
        headline6: base.headline6!.copyWith(fontWeight: FontWeight.w700),
        subtitle1: base.subtitle1!.copyWith(color: AppColor.white),
        subtitle2: base.subtitle2!
            .copyWith(color: AppColor.white, fontWeight: FontWeight.w700),
        bodyText1: base.bodyText1!.copyWith(color: AppColor.black),
        bodyText2: base.bodyText2!.copyWith(color: AppColor.whiteLight),
        caption: base.caption!.copyWith(color: AppColor.whiteLight),


      );
    }

    return base.copyWith(
        primaryColor: Colors.red,
        indicatorColor: Colors.black,
        dividerColor: AppColor.darkDivider,
        cardColor: AppColor.black,
        appBarTheme: base.appBarTheme.copyWith(
          color: const Color(0xff232323),
          elevation: 0,

          titleTextStyle: base.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          iconTheme: const IconThemeData(color: AppColor.white),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor:  Color(0xff232323),
          ),
        ),
        scaffoldBackgroundColor:const Color(0xff232323),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: AppColor.white),
        dialogTheme: base.dialogTheme.copyWith(
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.whiteLight),
            overlayColor:
                MaterialStateProperty.all(ThemeData.light().splashColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(base.splashColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: AppColor.whiteLight)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.29),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
        ),
        inputDecorationTheme: base.inputDecorationTheme.copyWith(
            border: InputBorder.none,
            isDense: true,
            filled: true,
            fillColor: const Color(0xFF434343),
            hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteLight)),
        cardTheme: CardTheme(
          color: const Color(0xff000000),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          elevation: 10,
          shadowColor: const Color(0xff000000).withOpacity(0.25),
        ),
        textTheme: _buildTextThemeDark(base.textTheme));
  }
}
