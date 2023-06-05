import 'package:flutter/material.dart';
import 'package:hcm23_03/features/authentication/data/resource/sqlite_helper.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hcm23DBHelper.init();
  Hcm23DBHelper.query("users");

  runApp(const MyApp());
}
