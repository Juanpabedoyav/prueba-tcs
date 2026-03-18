import 'package:challengetcs/features/post/data/models/post_model.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostsEntity', () {
    test('fromModel maps PostsModel fields to entity fields', () {
      final model = PostsModel(
        userId: 7,
        id: 12,
        title: 'Test title',
        body: 'Test body',
      );

      final entity = PostsEntity.fromModel(model);

      expect(entity.id, '12');
      expect(entity.title, 'Test title');
      expect(entity.body, 'Test body');
      expect(entity.author, '7');
    });

    test('supports value equality through Equatable', () {
      const entityA = PostsEntity(
        id: '1',
        title: 'Same title',
        body: 'Same body',
        author: '10',
      );
      const entityB = PostsEntity(
        id: '1',
        title: 'Same title',
        body: 'Same body',
        author: '10',
      );

      expect(entityA, equals(entityB));
      expect(entityA.props, ['1', 'Same title', 'Same body', '10']);
    });
  });
}
