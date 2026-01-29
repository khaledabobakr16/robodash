import '../models/telemetry_model.dart';

abstract class TelemetryDataSource {
  Stream<TelemetryModel> streamTelemetry();
}
