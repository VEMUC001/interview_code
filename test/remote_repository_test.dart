import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:macrofactor_test/home/view_model/remote_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_repository_test.mocks.dart';

@GenerateMocks([RemoteRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Remote Repository Tests',
    () {
      late RemoteRepository mockRemoteRepository;

      setUp(
        () {
          mockRemoteRepository = MockRemoteRepository();
        },
      );

      test(
        'Response is not null',
        () async {
          when(mockRemoteRepository.fetchCatStatusCode('200')).thenAnswer(
            (_) async {
              return Uint8List.fromList([1, 2, 3, 4, 5]);
            },
          );

          final response = await mockRemoteRepository.fetchCatStatusCode('200');
          expect(response, isNot(null));
        },
      );

      test(
        'Response is bytes and equal to the above',
        () async {
          when(mockRemoteRepository.fetchCatStatusCode('200')).thenAnswer(
            (_) async {
              return Uint8List.fromList([1, 2, 3, 4, 5]);
            },
          );

          final response = await mockRemoteRepository.fetchCatStatusCode('200');
          expect(response, isA<Uint8List>());
          expect(response, equals(Uint8List.fromList([1, 2, 3, 4, 5])));
        },
      );

      test(
        'Response is bytes and equal to the above',
        () async {
          when(mockRemoteRepository.fetchCatStatusCode('999'))
              .thenThrow(Exception('Status code is invalid'));

          try {
            await mockRemoteRepository.fetchCatStatusCode('999');
            fail('Response recieved');
          } catch (e) {
            expect(e, isException);
            expect(e.toString(), contains('Status code is invalid'));
          }
        },
      );
    },
  );
}
