import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
      fontFamily: 'Nunito',
    );
  }

  ThemeData getDarkMode() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: AppTheme.secondaryDark),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppTheme.secondaryDark,
      fontFamily: 'Nunito',
    );
  }

  var _isDark = false;

  bool get getIsDark {
    return _isDark;
  }

  void toggleThemeMode([bool? fromShared]) async {
    if (fromShared != null) {
      _isDark = fromShared;
      emit(ThemeModeChanged());
    } else {
      _isDark = !_isDark;
      emit(ThemeModeChanged());
    }
    await GetIt.I.get<SharedPreferences>().setBool('darkMode', _isDark);
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
