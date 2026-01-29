import 'package:robodash/data/datasources/fake_telemetry_data_source.dart';
import 'package:robodash/data/models/telemetry_model.dart';

import '../../data/datasources/telemetry_data_source.dart';

class StreamTelemetry {
  final TelemetryDataSource _dataSource;

  StreamTelemetry(this._dataSource);

  Stream<TelemetryModel> call() => _dataSource.streamTelemetry();

  void reset() {
    if (_dataSource is FakeTelemetryDataSource) {
      (_dataSource).retry();
    }
  }
}
