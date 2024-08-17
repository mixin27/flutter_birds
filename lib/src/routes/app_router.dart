// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'routes.dart';

part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),

        // Birds
        AutoRoute(page: BirdsListRoute.page, path: '/birds'),
        AutoRoute(page: BirdDetailRoute.page, path: '/birds/:id'),
      ];
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
