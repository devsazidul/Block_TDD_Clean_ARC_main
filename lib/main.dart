import 'package:bloc_tdd_arc/app.dart';
import 'package:bloc_tdd_arc/core/services/dependencies/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const CourseOnline());
}


