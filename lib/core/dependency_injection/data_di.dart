import 'package:get_it/get_it.dart';
import 'package:robodash/app/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:robodash/data/datasources/ml_kit_vision_data_source.dart';
import 'package:robodash/presentation/features/more/cubit/app_version_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/global_cubits/localization_cubit/locale_cubit.dart';
import '../../data/datasources/command_data_source.dart';
import '../../data/datasources/fake_command_data_source.dart';
import '../../data/datasources/fake_telemetry_data_source.dart';
import '../../data/datasources/telemetry_data_source.dart';
import '../../data/repositories/command_repository_impl.dart';
import '../../data/repositories/telemetry_repository_impl.dart';
import '../../data/repositories/vision_repository_impl.dart';
import '../../domain/repositories/command_repository.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../../domain/repositories/vision_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDataDI() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerSingleton<LocaleCubit>(LocaleCubit(prefs: prefs));
  getIt.registerSingleton<AppVersionCubit>(AppVersionCubit());

  getIt.registerSingleton<ThemeCubit>(ThemeCubit(prefs: prefs));

  getIt.registerLazySingleton<TelemetryDataSource>(
    () => FakeTelemetryDataSource(),
  );
  getIt.registerLazySingleton<TelemetryRepository>(
    () => TelemetryRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<MLKitVisionDataSource>(
    () => MLKitVisionDataSource(),
  );

  getIt.registerLazySingleton<VisionRepository>(
    () => VisionRepositoryImpl(getIt<MLKitVisionDataSource>()),
  );

  getIt.registerLazySingleton<CommandDataSource>(() => FakeCommandDataSource());
  getIt.registerLazySingleton<CommandRepository>(
    () => CommandRepositoryImpl(getIt()),
  );
}
