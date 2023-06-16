import 'package:flutter/material.dart';

import 'app.dart';
import 'features/authentication/data/resource/sqlite_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hcm23DBHelper.init();
  runApp(
    const MyApp(),
  );
}
