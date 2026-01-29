import 'package:get_it/get_it.dart';
import 'package:robodash/data/datasources/ml_kit_vision_data_source.dart';
import 'package:robodash/domain/usecases/send_command.dart';
import 'package:robodash/domain/usecases/stream_telemetry.dart';
import 'package:robodash/presentation/features/bottom_nav_bar/cubit/nav_bar_cubit.dart';
import 'package:robodash/presentation/features/control/cubit/command_cubit.dart';
import 'package:robodash/presentation/features/home/cubit/telemetry_cubit.dart';
import 'package:robodash/presentation/features/vision/cubit/vision_cubit.dart';
import 'package:robodash/presentation/features/voice/cubit/voice_cubit.dart';

final getIt = GetIt.instance;

void setupPresentationDI() {
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());

  getIt.registerFactory(() => TelemetryCubit(getIt<StreamTelemetry>()));

  getIt.registerSingleton<CommandCubit>(
    CommandCubit(sendCommandUseCase: getIt<SendCommand>()),
  );
  getIt.registerFactory<VisionCubit>(
    () => VisionCubit(dataSource: getIt<MLKitVisionDataSource>()),
  );
  getIt.registerFactory(() => VoiceCubit(commandCubit: getIt<CommandCubit>()));
}
