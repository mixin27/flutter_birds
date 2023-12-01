// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_birds/src/features/birds/birds.dart';
import 'package:flutter_birds/src/utils/async_value_ui.dart';
import 'bird_detail_controller.dart';

@RoutePage()
class BirdDetailPage extends HookConsumerWidget {
  const BirdDetailPage({
    super.key,
    @PathParam('id') required this.birdId,
  });

  final BirdId birdId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      birdDetailControllerProvider(birdId),
      (_, state) => state.showAlertDialogOnError(context),
    );

    final state = ref.watch(birdDetailControllerProvider(birdId));

    return Scaffold(
      appBar: AppBar(
        title: switch (state) {
          AsyncData(:final value) when value != null => Text(value.myanmarName),
          _ => const Text('Bird Detail'),
        },
      ),
      body: switch (state) {
        AsyncData(:final value) when value != null =>
          BirdDetailPageContent(bird: value),
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
      },
    );
  }
}

class BirdDetailPageContent extends StatelessWidget {
  const BirdDetailPageContent({super.key, required this.bird});

  final Bird bird;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: Image.asset(
            bird.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bird.myanmarName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bird.englishname,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
