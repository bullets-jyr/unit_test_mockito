import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:unit_test_mockito/album.dart';

import 'album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('The album should be returned successfully', () async {
      final client = MockClient();

      when(
        client.get(Uri.parse('http://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 1, "title": "quidem molestiae enim"}', 200),
      );

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('An exception should be thrown when a 404 error occurs', () async {
      final client = MockClient();

      when(
        client.get(Uri.parse('http://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
            (_) async =>
            http.Response('Not Found', 404),
      );

      expect(fetchAlbum(client), throwsException);
    });
  });
}
