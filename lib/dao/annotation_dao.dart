import 'base_dao.dart';
import 'package:potato_notes/models/annotation_model.dart';

class AnnotationDAO extends BaseDAO<AnnotationModel> {
  @override
  String get table => 'annotations';

  @override
  fromMap(Map<String, dynamic> map) {
    return AnnotationModel.fromMap(map);
  }

  Future<List<AnnotationModel>> getAnnotationsByThinkId(int thinkId) async {
    var dbClient = await db;
    final list = await dbClient
        .rawQuery('select * from $table where think_id = ?', [thinkId]);

    if (list.length > 0) {
      return list.map((map) => fromMap(map)).toList();
    }

    return [];
  }
}