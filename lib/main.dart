// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'src/app_bootstrap.dart';
import 'src/app_bootstrap_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();

  // create a container configured with all the required instances
  final container = await appBootstrap.createProviderContainer();

  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);

  // start the app
  runApp(root);
}
