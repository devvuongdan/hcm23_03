import 'package:flutter/material.dart';
import 'features/authentication/data/resource/sqlite_helper.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hcm23DBHelper.init();
  runApp(const MyApp());
}
