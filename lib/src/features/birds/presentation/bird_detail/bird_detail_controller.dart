// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_birds/src/features/birds/birds.dart';

part 'bird_detail_controller.g.dart';

@riverpod
class BirdDetailController extends _$BirdDetailController {
  Future<Bird?> _fetchData(BirdId id) async {
    final repository = ref.read(birdsRepositoryProvider);
    return repository.getBirdById(id);
  }

  @override
  FutureOr<Bird?> build(BirdId id) {
    return _fetchData(id);
  }
}
