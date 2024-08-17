// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_birds/src/features/birds/domain/bird.dart';
import 'package:flutter_birds/src/routes/routes.dart';
import 'package:flutter_birds/src/utils/async_value_ui.dart';
import 'birds_list_controller.dart';

@RoutePage()
class BirdsListPage extends StatelessWidget {
  const BirdsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birds'),
      ),
      body: const BirdsListPageContent(),
    );
  }
}

class BirdsListPageContent extends HookConsumerWidget {
  const BirdsListPageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      birdsListControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final state = ref.watch(birdsListControllerProvider);

    return switch (state) {
      AsyncData(value: final birds) when birds.isNotEmpty =>
        BirdsList(birds: birds),
      AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      AsyncError(:final error, stackTrace: var _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      _ => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              'No birds data',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
    };
  }
}

class BirdsList extends StatelessWidget {
  const BirdsList({
    super.key,
    required this.birds,
  });

  final List<Bird> birds;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: birds.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final bird = birds[index];
        return BirdsListItem(bird: bird);
      },
    );
  }
}

class BirdsListItem extends StatelessWidget {
  const BirdsListItem({
    super.key,
    required this.bird,
  });

  final Bird bird;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.router.push(BirdDetailRoute(birdId: bird.id)),
      leading: Image.asset(
        bird.imagePath,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      title: Text('${bird.myanmarName} (${bird.englishname})'),
      subtitle: Text(
        bird.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
