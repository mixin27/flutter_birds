// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_birds/src/errors/errors.dart';
import 'package:flutter_birds/src/features/app/app.dart';

/// Helper class to initialize services and configure the error handlers
class AppBootstrap {
  Widget createRootWidget({required ProviderContainer container}) {
    // * Register error handlers. For more info, see:
    // * https://docs.flutter.dev/testing/errors
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    return UncontrolledProviderScope(
      container: container,
      child: const AppWidget(),
    );
  }
}
