import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const CoverPageApp());
}
