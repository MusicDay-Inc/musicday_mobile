import 'package:flutter/material.dart';
import 'package:musicday_mobile/application.dart';
import 'package:musicday_mobile/application_di.dart';

void main() {
  configureDependencies();
  runApp(const Application());
}
