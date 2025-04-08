import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'bootstrap.dart';

void main() {
  Bootstrap.init(
    mainAppWidget: const ProviderScope(child: App()),
    runApp: runApp,
  );
}
