part of 'app_version_cubit.dart';

@immutable
sealed class AppVersionState {
  const AppVersionState();
}

class AppVersionInitial extends AppVersionState {
  const AppVersionInitial();
}

class AppVersionLoaded extends AppVersionState {
  final String version;

  const AppVersionLoaded(this.version);
}

class AppVersionError extends AppVersionState {
  final String message;

  const AppVersionError(this.message);
}
