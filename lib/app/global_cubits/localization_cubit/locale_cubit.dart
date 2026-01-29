import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const _keyLanguageCode = 'language_code';
  final SharedPreferences prefs;

  LocaleCubit({required this.prefs})
    : super(const LocaleState(locale: Locale('en'))) {
    _loadLocale();
  }

  Future<void> changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    await prefs.setString(_keyLanguageCode, locale.languageCode);
  }

  Future<void> toggleLocale() async {
    final newLocale = state.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    await changeLocale(newLocale);
  }

  void _loadLocale() {
    final code = prefs.getString(_keyLanguageCode);
    if (code != null && code.isNotEmpty) {
      emit(state.copyWith(locale: Locale(code)));
    }
  }
}
