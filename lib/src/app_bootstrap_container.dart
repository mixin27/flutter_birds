// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_birds/src/errors/errors.dart';
import 'app_bootstrap.dart';

extension AppBootstrapFirebase on AppBootstrap {
  Future<ProviderContainer> createProviderContainer({
    List<Override> overrides = const [],
  }) async {
    // Initialize Provider overrides values here

    // return the prepare provider container
    return ProviderContainer(
      overrides: [
        ...overrides,
        // inject your overrides values here
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}
