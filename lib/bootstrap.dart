import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/config/config.dart';

class Bootstrap {
  const Bootstrap._();

  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // For preparing the key-value mem cache

    // For preparing to read application directory paths

    // Initialize firebase SDK

    // For preparing the error monitoring SDK and loading
    // up the `runApp` method in a guarded zone
    await _setupSentrySDK(runApp, mainAppWidget);

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _setupSentrySDK(
    void Function(Widget) appRunner,
    Widget app,
  ) async {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = Config.sentryDSN
          ..tracesSampleRate = kDebugMode ? 1.0 : 0.7;
      },
      appRunner: () => appRunner(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: app,
        ),
      ),
    );
  }
}
