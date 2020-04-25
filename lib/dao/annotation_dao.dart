import 'base_dao.dart';
import 'package:potato_notes/entities/annotation.dart';

class AnnotationDAO extends BaseDAO<Annotation> {
  @override
  String get table => 'annotations';

  @override
  fromMap(Map<String, dynamic> map) {
    return Annotation.fromMap(map);
  }

  Future<List<Annotation>> getAnnotationsByThinkId(int thinkId) async {
    var dbClient = await db;
    final list = await dbClient
        .rawQuery('select * from $table where think_id = ?', [thinkId]);

    if (list.length > 0) {
      return list.map((map) => fromMap(map)).toList();
    }

    return [];
  }
}
