import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

void main() async {
  GetStorage.init();
  runApp(const CoverPageApp());
}
