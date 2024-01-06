import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter9/core/app/app.dart';
import 'package:neobis_flutter_chapter9/core/dependencies/dependency_injection.dart';

void main() {
  setupDependencies();
  runApp(
    const MyApp(),
  );
}
