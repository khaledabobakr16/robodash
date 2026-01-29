part of 'splash_cubit.dart';

@immutable
sealed class SplashState {
  final int progress;
  const SplashState({this.progress = 0});
}

class SplashInit extends SplashState {
  const SplashInit() : super(progress: 0);
}

class SplashLoading extends SplashState {
  const SplashLoading({super.progress});
}

class SplashCompleted extends SplashState {
  const SplashCompleted() : super(progress: 100);
}
