import 'package:potato_notes/dao/base_dao.dart';
import 'package:potato_notes/entities/think.dart';

class ThinkDAO extends BaseDAO<Think> {
  @override
  String get table => 'thinks';

  @override
  Think fromMap(Map<String, dynamic> map) {
    return Think.fromMap(map);
  }
}
