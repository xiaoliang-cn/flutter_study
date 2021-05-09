import 'package:flutter/material.dart';

class MyTheme {
//全局的颜色管理
  static const _lightFillColor = Colors.black;

  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      backgroundColor: Colors.grey,
      primaryColorLight: Colors.grey,
      colorScheme: colorScheme,
      // textTheme: _textTheme,
      // primaryColor: const Color(0XFF030303),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          // titleTextStyle: TextStyle(color: Colors.black),
          elevation: 0,
          iconTheme: IconThemeData(color: colorScheme.onPrimary),
          brightness: colorScheme.brightness),
      tabBarTheme: TabBarTheme(
          labelColor: colorScheme.onPrimary,
          indicatorSize: TabBarIndicatorSize.label),
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.tealAccent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            Color.alphaBlend(_lightFillColor.withOpacity(0.80), _darkFillColor),
        // contentTextStyle: _textTheme.subtitle1.apply(color: _darkFillColor)
      ),
    );
  }

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.grey,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // static const _regular = FontWeight.w300;
  // static const _medium = FontWeight.w300;
  // static const _semiBold = FontWeight.w400;
  // static const _bold = FontWeight.w500;

  // //字体主题
  // static final TextTheme _textTheme = TextTheme(
  //   headline4: GoogleFonts.oswald(fontWeight: _bold, fontSize: 20.0),
  //   caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
  //   headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
  //   subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
  //   overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
  //   bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
  //   subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
  //   bodyText2: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
  //   headline6: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  // );

}
