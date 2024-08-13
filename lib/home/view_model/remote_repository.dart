import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrofactor_test/home/constants.dart';
import 'package:http/http.dart' as http;

Provider remoteRepositoryProvider = Provider(
  (ref) => RemoteRepository(),
);

class RemoteRepository {
  Future<Uint8List> fetchCatStatusCode(String statusCode) async {
    Uri uri = Uri.parse('${StringConstants.url}/$statusCode');
    final response = await http.get(
      uri,
    );
    return response.bodyBytes;
  }
}
