// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_birds/src/features/birds/birds.dart';
import 'package:flutter_birds/src/utils/utils.dart';

part 'birds_repository.g.dart';

class BirdsRepository {
  Future<List<Bird>> getAllBirds() async {
    try {
      final rawData = await loadStringFromAssets('assets/Birds.json');
      final jsonData = jsonDecode(rawData);

      final birds = jsonData['Tbl_Bird'] as List<dynamic>;

      // You can ignore compute function and just return direct.
      // But now, I want to parse json to dart model in background thread.
      return compute(
        (message) => message.map((e) => Bird.fromJson(e)).toList(),
        birds,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Bird?> getBirdById(BirdId id) async {
    try {
      final rawData = await loadStringFromAssets('assets/Birds.json');
      final jsonData = jsonDecode(rawData);

      final birdsJson = jsonData['Tbl_Bird'] as List<dynamic>;

      // You can ignore compute function and just return direct.
      // But now, I want to parse json to dart model in background thread.
      final birds = await compute(
        (message) => message.map((e) => Bird.fromJson(e)).toList(),
        birdsJson,
      );

      final idx = birds.indexWhere((element) => element.id == id);
      if (idx == -1) return null;

      return birds[idx];
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
BirdsRepository birdsRepository(BirdsRepositoryRef ref) {
  return BirdsRepository();
}
