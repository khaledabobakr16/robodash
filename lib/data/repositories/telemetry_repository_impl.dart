import '../../domain/entities/telemetry.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../datasources/telemetry_data_source.dart';

class TelemetryRepositoryImpl implements TelemetryRepository {
  final TelemetryDataSource dataSource;

  TelemetryRepositoryImpl(this.dataSource);

  @override
  Stream<Telemetry> streamTelemetry() {
    return dataSource.streamTelemetry().map((model) => model);
  }
}
