import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class ThemeState {
  const ThemeState();
}

class LightThemeState extends ThemeState {
  const LightThemeState();
}

class DarkThemeState extends ThemeState {
  const DarkThemeState();
}

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'theme_mode';
  final SharedPreferences prefs;

  ThemeCubit({required this.prefs}) : super(const LightThemeState()) {
    _loadTheme();
  }

  void toggleTheme() {
    if (state is LightThemeState) {
      emit(const DarkThemeState());
      prefs.setBool(_key, true);
    } else {
      emit(const LightThemeState());
      prefs.setBool(_key, false);
    }
  }

  void _loadTheme() {
    final isDark = prefs.getBool(_key) ?? false;
    if (isDark) {
      emit(const DarkThemeState());
    } else {
      emit(const LightThemeState());
    }
  }
}
