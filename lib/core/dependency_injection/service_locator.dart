import 'package:get_it/get_it.dart';
import 'data_di.dart';
import 'domain_di.dart';
import 'presentation_di.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  await setupDataDI();
  setupDomainDI();
  setupPresentationDI();
}
