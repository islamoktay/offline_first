import 'package:flutter/material.dart';

import 'package:offline_first/core/dependency_injection/di.dart';
import 'package:offline_first/core/main/offline_first_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const OfflineFirstDemo());
}
