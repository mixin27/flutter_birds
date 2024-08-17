// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_birds/src/features/birds/birds.dart';

part 'birds_list_controller.g.dart';

@riverpod
class BirdsListController extends _$BirdsListController {
  Future<List<Bird>> _fetchData() async {
    final repository = ref.read(birdsRepositoryProvider);
    final birds = await repository.getAllBirds();
    return birds;
  }

  @override
  FutureOr<List<Bird>> build() {
    return _fetchData();
  }
}
