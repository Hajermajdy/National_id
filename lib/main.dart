import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:national_id/src/app_root.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("box");

  runApp(AppRoot());
}