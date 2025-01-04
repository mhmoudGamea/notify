import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/core/config/constants.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  ThemeData getLightMode() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: AppTheme.white),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppTheme.white,
      fontFamily: 'cairo',
    );
  }

  ThemeData getDarkMode() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: AppTheme.secondaryDark),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppTheme.secondaryDark,
      fontFamily: 'cairo',
    );
  }

  bool _isDark = false;

  bool get getIsDark {
    SharedPreferences prefs = GetIt.instance<SharedPreferences>();
    return prefs.getBool(Constants.kIsDarkMode) ?? false;
  }

  toggleThemeMode() async {
    SharedPreferences prefs = GetIt.instance<SharedPreferences>();

    _isDark = prefs.getBool(Constants.kIsDarkMode) ?? false;
    _isDark = !_isDark;
    prefs.setBool(Constants.kIsDarkMode, _isDark);
    emit(ThemeModeChanged());
  }

  // this function 'll change the theme of datePicker and timePicker
  Theme getDateTimeTheme(BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: context.watch<ThemeCubit>().getIsDark
            ? const ColorScheme.dark(
                primary: Color.fromARGB(255, 59, 88, 130),
                onPrimary: AppTheme.darkBlue,
                onSurface: AppTheme.darkBlue,
              )
            : const ColorScheme.light(
                primary: Color.fromARGB(255, 190, 213, 245),
                onPrimary: AppTheme.darkBlue,
                onSurface: AppTheme.darkBlue,
              ),
      ),
      child: child!,
    );
  }
}
