import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_version_state.dart';

class AppVersionCubit extends Cubit<AppVersionState> {
  AppVersionCubit() : super(const AppVersionInitial());

  Future<void> loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      emit(AppVersionLoaded(info.version));
    } catch (e) {
      emit(AppVersionError('Failed to load version'));
    }
  }
}
