import 'base_dao.dart';
import 'package:jubjub/models/annotation_file_model.dart';

class AnnotationFileDAO extends BaseDAO<AnnotationFileModel> {
  @override
  String get table => 'annotation_files';

  @override
  AnnotationFileModel fromMap(Map<String, dynamic> map) {
    return AnnotationFileModel.fromMap(map);
  }

  Future<List<AnnotationFileModel>> getAnnotationsFileByAnnotationId(
    int annotationId,
  ) async {
    var dbClient = await db;
    final list = await dbClient.rawQuery(
        'select * from $table where annotation_id = ?', [annotationId]);

    if (list.length > 0) {
      return list.map((map) => fromMap(map)).toList();
    }

    return [];
  }

  Future<List<String>> getAnnotationsFilesPaths() async {
    var dbClient = await db;
    final list = await dbClient.rawQuery('select path from $table');

    if (list.length > 0) {
      return list.map((map) => map['path'].toString()).toList();
    }

    return [];
  }
}
