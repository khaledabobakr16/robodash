import 'package:get_it/get_it.dart';
import 'package:robodash/data/datasources/telemetry_data_source.dart';
import 'package:robodash/domain/repositories/command_repository.dart';
import 'package:robodash/domain/repositories/vision_repository.dart';
import 'package:robodash/domain/usecases/send_command.dart';
import 'package:robodash/domain/usecases/stream_detections.dart';
import 'package:robodash/domain/usecases/stream_telemetry.dart';

final getIt = GetIt.instance;

void setupDomainDI() {
  getIt.registerSingleton<StreamTelemetry>(
    StreamTelemetry(getIt<TelemetryDataSource>()),
  );

  getIt.registerLazySingleton<StreamDetections>(
    () => StreamDetections(getIt<VisionRepository>()),
  );
  getIt.registerLazySingleton<SendCommand>(
    () => SendCommand(getIt<CommandRepository>()),
  );
}
