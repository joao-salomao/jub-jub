import 'package:potato_notes/entities/annotation_file.dart';

import 'base_dao.dart';

class AnnotationFileDAO extends BaseDAO<AnnotationFile> {
  @override
  String get table => 'annotation_files';

  @override
  AnnotationFile fromMap(Map<String, dynamic> map) {
    return AnnotationFile.fromMap(map);
  }

  Future<List<AnnotationFile>> getAnnotationsFileByAnnotationId(
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
}
