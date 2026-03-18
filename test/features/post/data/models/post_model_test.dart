import 'package:challengetcs/features/post/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostsModel', () {
    test('fromJson creates a model from a json map', () {
      final json = {
        'userId': 3,
        'id': 8,
        'title': 'Model title',
        'body': 'Model body',
      };

      final model = PostsModel.fromJson(json);

      expect(model.userId, 3);
      expect(model.id, 8);
      expect(model.title, 'Model title');
      expect(model.body, 'Model body');
    });

    test('toJson serializes the model fields', () {
      final model = PostsModel(
        userId: 3,
        id: 8,
        title: 'Model title',
        body: 'Model body',
      );

      expect(model.toJson(), {
        'userId': 3,
        'id': 8,
        'title': 'Model title',
        'body': 'Model body',
      });
    });
  });
}
