import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInit());

  void startSplash({int durationSeconds = 3}) async {
    emit(const SplashLoading(progress: 0));

    int steps = durationSeconds * 10;
    for (int i = 1; i <= steps; i++) {
      await Future.delayed(
        Duration(milliseconds: (durationSeconds * 1000 ~/ steps)),
      );
      emit(SplashLoading(progress: (i * 100 ~/ steps)));
    }

    emit(const SplashCompleted());
  }
}
