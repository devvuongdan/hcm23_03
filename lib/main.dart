import 'package:flutter/material.dart';
import 'package:hcm23_03/features/tasks/pages/new_task_page.dart';
import 'package:provider/provider.dart';
import 'features/authentication/data/resource/sqlite_helper.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hcm23DBHelper.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MyApp(),
    ),
  );
}
