import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:udecproject/hiveLogin%20using%20HiveAdapter/screen/Login.dart';

import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 // Hive.registerAdapter(adapter);
  await Hive.openBox<User>('user');
  runApp(GetMaterialApp(home : Login()));
}
