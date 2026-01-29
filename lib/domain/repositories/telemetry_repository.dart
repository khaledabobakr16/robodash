import '../entities/telemetry.dart';

abstract class TelemetryRepository {
  Stream<Telemetry> streamTelemetry();
}
