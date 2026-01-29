import 'package:flutter/material.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(RoboDashApp());
}
