import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';

Future<void> bootstrap() async {
  await Supabase.initialize(
    url: 'https://awiywxzyxyirtuuhwbvf.supabase.co',
    anonKey: 'key',
  );

  runApp(ProviderScope(child: const App()));
}
