import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrofactor_test/home/constants.dart';
import 'package:macrofactor_test/home/view_model/remote_repository.dart';

final fetchCatImageProvider = FutureProvider<Uint8List>(
  (ref) {
    String status = ref.watch(generateRandomStatusCode);
    return ref.watch(remoteRepositoryProvider).fetchCatStatusCode(status);
  },
);

final generateRandomStatusCode = StateNotifierProvider<RandomStringGen, String>(
  (ref) {
    return RandomStringGen('200');
  },
);

class RandomStringGen extends StateNotifier<String> {
  RandomStringGen(super.state);

  String generateStatusCode() {
    final randInt = Random().nextInt(StringConstants.httpStatusCodes.length);
    state = StringConstants.httpStatusCodes[randInt];
    return state;
  }
}
